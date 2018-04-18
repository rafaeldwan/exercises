/*eslint-disable semi*/

var templates = {};

/*************
 *    Data   *
 **************/

var animals = [{
  name: 'Fennec Fox',
  caption: 'Resembling both dog and cat, the Fennec Fox is a very cool, small pet to own. The smallest of all the world’s foxes, it naturally lives in the Sahara Desert and elsewhere in North Africa. These nocturnal mammals usually forage for plants but also eat rodents, eggs, reptiles, and insects.',
  url: 'https://cdn4.list25.com/wp-content/uploads/2017/04/25-23-610x438.jpg',
},
{
  name: 'Chinchilla',
  caption: 'Native to mountains of western Mexico, the Mexican Redknee Tarantula is one of the most popular pets among spider enthusiasts. It is a very large, interestingly colored spider that can live for up to 30 years and is relatively easy to care for.',
  url: 'https://cdn4.list25.com/wp-content/uploads/2017/04/24-24-610x458.jpg',
},
{
  name: 'Mexican Redknee Tarantula',
  caption: 'Naturally found in the Andes Mountains in South America, the Chinchilla is prized for its beautiful soft lush fur, and curious, boisterous nature and no objectionable noises. They are low-maintenance pets, but they are very fragile and might bite when squeezed too tightly.',
  url: 'https://cdn.list25.com/wp-content/uploads/2017/04/23-22-610x461.jpg',
},
{
  name: 'Freshwater Stingray',
  caption: 'While the Freshwater Stingray looks really cool, and it will certainly be the main attraction of your fish tank, caring for them is no easy task. They need very large aquariums with a huge bottom area. Stingrays are also sensitive to the water chemistry and purity, so a frequent water change is a must.',
  url: 'https://cdn2.list25.com/wp-content/uploads/2017/04/22-23-610x343.jpg',
},
{
  name: 'Sugar Glider',
  caption: 'Native to Australia, Papua New Guinea, and Indonesia, the Sugar Glider is a cute little marsupial. They have become popular as exotic pets because they are very social and bond easily with humans. It is best to get two or more Sugar Gliders if you cannot be home a lot to keep them company.',
  url: 'https://cdn.list25.com/wp-content/uploads/2017/04/21-23-610x457.jpg',
},
{
  name: 'Kinkajou',
  caption: 'Also known as the honey bear, the Kinkajou is a small mammal that lives in tropical forests of Central and South America, where it spends most of the time in the trees. These cute animals are usually playful and docile, but they can be agitated when woken up during the day (they are nocturnal). They also often carry a dangerous ringworm.',
  url: 'https://cdn4.list25.com/wp-content/uploads/2017/04/5-22-610x494.jpg',
},
];

var languages = [{
  name: 'Ruby',
  description: 'Ruby is a dynamic, reflective, object-oriented, ' +
      'general-purpose programming language. It was designed and developed in the mid-1990s ' +
      'by Yukihiro Matsumoto in Japan. According to its creator, Ruby was influenced by Perl, ' +
      'Smalltalk, Eiffel, Ada, and Lisp. It supports multiple programming paradigms, ' +
      'including functional, object-oriented, and imperative. It also has a dynamic type ' +
      'system and automatic memory management.'
},

{
  name: 'JavaScript',
  description: 'JavaScript is a high-level, dynamic, untyped, and interpreted ' +
      'programming language. It has been standardized in the ECMAScript language ' +
      'specification. Alongside HTML and CSS, JavaScript is one of the three core ' +
      'technologies of World Wide Web content production; the majority of websites employ ' +
      'it, and all modern Web browsers support it without the need for plug-ins. JavaScript ' +
      'is prototype-based with first-class functions, making it a multi-paradigm language, ' +
      'supporting object-oriented, imperative, and functional programming styles.'
},

{
  name: 'Lisp',
  description: 'Lisp (historically, LISP) is a family of computer programming languages ' +
      'with a long history and a distinctive, fully parenthesized prefix notation. ' +
      'Originally specified in 1958, Lisp is the second-oldest high-level programming ' +
      'language in widespread use today. Only Fortran is older, by one year. Lisp has changed ' +
      'since its early days, and many dialects have existed over its history. Today, the best ' +
      'known general-purpose Lisp dialects are Common Lisp and Scheme.'
}
];

var todos = [{
  id: 1,
  title: 'Homework'
},
{
  id: 2,
  title: 'Shopping'
},
{
  id: 3,
  title: 'Calling Mom'
},
{
  id: 4,
  title: 'Coffee with John'
},];

var cars = [{
  id: 0,
  make: 'Honda',
  image: 'images/honda-accord-2005.jpg',
  model: 'Accord',
  year: 2005,
  price: 7000
},
{
  id: 1,
  make: 'Honda',
  image: 'images/honda-accord-2008.jpg',
  model: 'Accord',
  year: 2008,
  price: 11000
},
{
  id: 2,
  make: 'Toyota',
  image: 'images/toyota-camry-2009.jpg',
  model: 'Camry',
  year: 2009,
  price: 12500
},
{
  id: 3,
  make: 'Toyota',
  image: 'images/toyota-corrolla-2016.jpg',
  model: 'Corrolla',
  year: 2016,
  price: 15000
},
{
  id: 4,
  make: 'Suzuki',
  image: 'images/suzuki-swift-2014.jpg',
  model: 'Swift',
  year: 2014,
  price: 9000
},
{
  id: 5,
  make: 'Audi',
  image: 'images/audi-a4-2013.jpg',
  model: 'A4',
  year: 2013,
  price: 25000
},
{
  id: 6,
  make: 'Audi',
  image: 'images/audi-a4-2013.jpg',
  model: 'A4',
  year: 2013,
  price: 26000
},
];

var questions = [{
  id: 1,
  description: 'Who is the author of <cite>The Hitchhiker\'s Guide to the Galaxy</cite>?',
  options: ['Dan Simmons', 'Douglas Adams', 'Stephen Fry', 'Robert A. Heinlein']
},
{
  id: 2,
  description: 'Which of the following numbers is the answer to Life, the \
                  universe and everything?',
  options: ['66', '13', '111', '42']
},
{
  id: 3,
  description: 'What is Pan Galactic Gargle Blaster?',
  options: ['A drink', 'A machine', 'A creature', 'None of the above']
},
{
  id: 4,
  description: 'Which star system does Ford Prefect belong to?',
  options: ['Aldebaran', 'Algol', 'Betelgeuse', 'Alpha Centauri']
}
];

var answerKey = [{
  number: '1',
  answer: 'Douglas Adams'
},
{
  number: '2',
  answer: '42'
},
{
  number: '3',
  answer: 'A drink'
},
{
  number: '4',
  answer: 'Betelgeuse'
},
];

/*************
 *  Objects  *
 **************/

var stopwatch = {
  interval: null,
  start() {
    var $centi = $('.centiseconds'),
      $secs = $('.seconds'),
      $min = $('.minutes'),
      $hr = $('.hours'),
      newCenti, newSec, newMin;

    function format(int) {
      var string = String(int);
      return string.length === 1 ? '0' + string : string;
    }
    $(this).addClass('stop').removeClass('start').text('Stop');

    stopwatch.interval = setInterval(function () {
      newCenti = +$centi.text() + 1;
      if (newCenti % 100 === 0) {
        $centi.text('00');
        newSec = +$secs.text() + 1;
        if (newSec % 60 === 0) {
          newMin = +$min.text() + 1;
          $secs.text('00');
          if (newMin % 60 === 0) {
            $hr.text(format(+$hr.text() + 1));
            $min.text('00');
          } else {
            $min.text(format(newMin));
          }
        } else {
          $secs.text(format(newSec));
        }
      } else {
        $centi.text(format(newCenti));
      }
    }, 10);

  },
  stop() {
    clearInterval(stopwatch.interval);
    $(this).addClass('start').removeClass('stop').text('Start');
  },
  reset() {
    $('.stop').click();
    $('.stopwatch span:not(.seperator)').text('00');
  },
}

var carForm = {
  options: cars.reduce(function (options, car) {
    if (options.makes.indexOf(car.make) === -1) {
      options.makes.push(car.make);
    }
    if (options.models.indexOf(car.model) === -1) {
      options.models.push(car.model);
    }
    if (options.years.indexOf(car.year) === -1) {
      options.years.push(car.year);
    }
    if (options.prices.indexOf(car.price) === -1) {
      options.prices.push(car.price);
    }

    return options;
  }, {
    makes: [],
    models: [],
    years: [],
    prices: [],
  }),
  filter() {
    var results = $(this).serializeArray();
    $('.car').show();
    results.forEach(function (result) {
      if (result.value !== 'all') {
        if (result.name === 'price') {
          // remove leading '$'
          result.value = result.value.slice(1);
        }
        cars.forEach(function (car) {
          if (String(car[result.name]) !== result.value) {
            $('.car[data-id="' + car.id + '"]').hide();
          }
        });
      }
    });
  },
  changeMake() {
    var make = $(this).val();

    if (make === 'all') {
      $('#models option:disabled').removeAttr('disabled');
    } else {
      cars.forEach(function (car) {
        if (car.make !== make) {
          $('#models option[value="' + car.model + '"]').attr('disabled', 'disabled');
        } else {
          $('#models option[value="' + car.model + '"]').removeAttr('disabled');
        }
      });
    }
  },
  init() {
    $('.carFilter select').each(function() {
      var id = this.id;
      carForm.options[id].forEach(function (option) {
        option = id === 'prices' ? '$' + option : option;
        $(this).append('<option value="' + option + '">' + option + '</option>');
      }.bind(this));
    })
  },
}

var calculator = {
  total: 0,
  totalShowing: true,
  lastOp: undefined,
  init() {
    this.$equation = $('.equation');
    this.$currentNum = $('.currentNum');
  },
  parseAction($target) {
    if (Number.isNaN(+$target.text())) {
      this.parseNonNum($target.text());
    } else {
      this.displayNum($target);
    }
  },
  parseNonNum(opString) {
    var currentNum = +this.$currentNum.text();
    switch (opString) {
    case 'CE':
      this.clearEverything();
      break;
    case 'C':
      this.clearNum();
      break;
    case 'Neg':
      this.neg(currentNum);
      break;
    case '.':
      this.decPoint();
      break;
    case '=':
      this.equals(currentNum);
      break;
    default:
      this.updateEq(currentNum, opString);
      this.updateTotal(currentNum, opString);
    }
  },
  updateEq(num, op) {
    var currentEq = this.$equation.text();
    this.$equation.text(currentEq + num + ' ' + op + ' ');
  },
  updateTotal(num, op) {
    if (this.lastOp) {
      switch (this.lastOp) {
      case '+':
        this.add(num);
        break;
      case '-':
        this.subtract(num);
        break;
      case 'x':
        this.multiply(num);
        break;
      case '/':
        this.divide(num);
        break;
      case '%':
        this.remainder(num);
        break;
      }
      this.$currentNum.text(this.total);
    } else {
      this.$currentNum.text(num);
      this.total = num;
    }
    this.lastOp = op;
    this.totalShowing = true;
  },
  displayNum($target) {
    var currentVal = this.$currentNum.text();
    if (this.totalShowing) {
      this.$currentNum.text($target.text());
      this.totalShowing = false;
    } else {
      this.$currentNum.text(currentVal + $target.text());
    }
  },
  clearEverything() {
    this.total = '';
    this.$currentNum.text('0');
    this.$equation.text('');
    this.totalShowing = true;
  },
  clearNum() {
    this.$currentNum.text('0');
    this.totalShowing = true;
  },
  decPoint() {
    var currentVal = this.$currentNum.text();
    if (currentVal.indexOf('.') === -1) {
      this.$currentNum.text(currentVal + '.');
      this.totalShowing = false;
    }
  },
  neg(num) {
    this.$currentNum.text(-num);
    this.totalShowing = false;
  },
  add(num) {
    this.total += num;
  },
  subtract(num) {
    this.total -= num;
  },
  multiply(num) {
    this.total *= num;
  },
  divide(num) {
    this.total /= num;
  },
  remainder(num) {
    this.total = this.total % num;
  },
  equals(num) {
    this.$equation.text('');
    this.updateTotal(num);
  },
};

var wysiwyg = {
  parseClick($this) {
    var action, value;
    if ($this.hasClass('bold')) {
      action = 'bold';
    } else if ($this.hasClass('italicize')) {
      action = 'italic';
    } else if ($this.hasClass('underline')) {
      action = 'underline';
    } else if ($this.hasClass('strikethrough')) {
      action = 'strikeThrough';
    } else if ($this.hasClass('link')) {
      action = 'createLink';
      value = this.getValue('Please provide URL');
    } else if ($this.hasClass('bold')) {
      action = 'bold';
    } else if ($this.hasClass('ul')) {
      action = 'insertUnorderedList';
    } else if ($this.hasClass('ol')) {
      action = 'insertOrderedList';
    } else if ($this.hasClass('al_left')) {
      action = 'justifyLeft';
    } else if ($this.hasClass('al_right')) {
      action = 'justifyRight';
    } else if ($this.hasClass('al_center')) {
      action = 'justifyCenter';
    } else if ($this.hasClass('al_justify')) {
      action = 'justifyFull';
    }
    this.performAction(action, value);
  },
  getValue(message) {
    return prompt(message);
  },
  performAction(action, value) {
    document.execCommand(action, false, value);
  },
};

var quiz = {
  submit() {
    var $this = $(this)
    var submitted = quiz.formatAnswer($this)
    var results = quiz.gradeQuiz(submitted)
    quiz.showResults($this, results)
  },
  formatAnswer($this) {
    return $this.serializeArray().reduce(function (obj, answer) {
      obj[answer.name] = answer.value;
      return obj
    }, {})
  },
  gradeQuiz(submitted) {
    return answerKey.reduce(function (rObj, answer) {
      var checkMe = submitted['answers' + answer.number]
      if (checkMe) {
        rObj[answer.number] = checkMe === answer.answer ? 'correct' : 'incorrect'
      } else {
        rObj[answer.number] = 'unanswered'
      }
      return rObj
    }, {})
  },
  showResults($this, results) {
    quiz.reset()
    $this.find('.question').each(function () {
      var $eachThis = $(this);
      var id = $eachThis.data('id')
      var resultObj = {
        resultClass: results[id]
      }
      switch (results[id]) {
      case 'correct':
        resultObj.result = 'Correct!'
        break;
      case 'incorrect':
        resultObj.result = 'Sorry, that\'s not the right answer.'
        break;
      case 'unanswered':
        resultObj.result = 'Don\'t panic, but you didn\'t even answer this one.'
        break;
      }
      $eachThis.append(templates.result(resultObj))
    })
  },
  reset() {
    $('.results').remove();
  },
}

/*************
 *   jQuery   *
 **************/

$(function () {
  var delay = null;

  languages = languages.map(function (language) {
    return {
      name: language.name,
      description: language.description,
      shortD: language.description.slice(0, 119),
      remainingD: language.description.slice(119, -1),
    };
  });

  // Compiles all handlebars scripts into the templates object
  $('script[type="text/x-handlebars"]').each(function () {
    var $tmpl = $(this);
    templates[$tmpl.attr('id')] = Handlebars.compile($tmpl.html());
  });

  $('[data-type=partial]').each(function () {
    var $partial = $(this);
    Handlebars.registerPartial($partial.attr('id'), $partial.html());
  });

  // build page
  $('.animals').append(templates.animalGrid({
    animals: animals
  }));
  $('.languages').append(templates.languages({
    languages: languages
  }));
  $('.todos').append(templates.todos({
    todos: todos
  }));
  $('.car-grid').append(templates.cars({
    cars: cars
  }));
  carForm.init()
  calculator.init();
  $('.test').append(templates.test({
    questions: questions
  }));

  /*************
   *   Events   *
   **************/

  $('.animals').on('mouseenter', 'figure', function () {
    var $this = $(this);
    delay = setTimeout(function () {
      $this.find('figcaption').fadeIn();
    }, 2000);
  });

  $('.animals').on('mouseleave', 'figure', function () {
    clearTimeout(delay);
    var $this = $(this);
    $this.find('figcaption').fadeOut();
  });

  $('.expando').click(function (e) {
    var $this = $(this);
    if ($this.hasClass('retracto')) {
      $this.parent().find('button').text('Show More');
    } else {
      $this.parent().find('button').text('Show Less');
    }

    $this.toggleClass('retracto');
    $this.parent().find('.remainingD').fadeToggle();
  });

  $('.delete, .doIt, .nah').click(function () {
    $('.confirmPrompt').slideToggle(600);
    $('.overlay').fadeToggle(600);
  });

  $('.delete').click(function () {
    $('.confirmPrompt').data('id', $(this).data('id'));
  });

  $('.doIt').click(function (e) {
    $('.todo[data-id="' + $('.confirmPrompt').data('id') + '"]').remove();
  });

  $('.todo').contextmenu(function (e) {
    e.preventDefault();
    $('.menu').hide();
    $(this).children('.menu').show();
  });

  $(document.body).click(function () {
    $('.menu').hide();
  });

  $('.carFilter').submit(function (e) {
    e.preventDefault();
    (carForm.filter.bind(this))()
  });

  $('#makes').change(function () {
    (carForm.changeMake.bind(this))()
  });

  $('.stopwatch').on('click', '.start', function (e) {
    e.stopPropagation();
    (stopwatch.start.bind(this))()
  });

  $('.stopwatch').on('click', '.stop', function (e) {
    e.stopPropagation();
    (stopwatch.stop.bind(this))()
  });

  $('.reset').click(function () {
    stopwatch.reset()
  });

  $('.calculator td').click(function () {
    calculator.parseAction($(this));
  });

  $('.controls button').click(function () {
    wysiwyg.parseClick($(this));
  });

  $('#test-form').submit(function (e) {
    e.preventDefault();
    (quiz.submit.bind(this))()
  })

  $('#test-form').on('reset', function () {
    quiz.reset()
  })
});

/*************
 *    Form    *
 **************/

document.addEventListener('DOMContentLoaded', function () {

  var firstName = document.querySelector('#firstName'),
    lastName = document.querySelector('#lastName'),
    email = document.querySelector('#email'),
    password = document.querySelector('#password'),
    tel = document.querySelector('#tel'),
    validForm = document.querySelector('.validate form'),
    error = document.querySelector('.formError'),
    ccField = document.querySelector('.cc-fields'),
    inputs = Array.prototype.slice.call(document.querySelectorAll('.validate input:not([type="submit"])'));


  function checkForError(target, message) {
    if (!target.validity.valid) {
      displayInputError(target, message);
    }
  }

  function displayInputError(target, message) {
    var inputError = document.createElement('p');
    inputError.classList.add('inputError');
    inputError.textContent = message;
    target.insertAdjacentElement('afterEnd', inputError);
  }

  function allValid() {
    var allGood = inputs.reduce(function (bool, input) {
      if (!input.validity.valid) {
        bool = false;
      }
      return bool;
    }, true);
    return allGood;
  }

  function showErrors() {
    inputs.forEach(function (input) {
      input.dispatchEvent(new FocusEvent('focus', {
        'bubbles': true
      }));
      input.dispatchEvent(new FocusEvent('blur'));
    });
  }

  firstName.addEventListener('blur', function (e) {
    if (e.target.validity.patternMismatch) {
      displayInputError(e.target, 'You can only have letters in your first name, dawg')
    } else {
      checkForError(e.target, 'Please provide a name, dawg');
    }
  });

  firstName.addEventListener('keypress', function (e) {
    var alphas = new RegExp(/[a-zA-Z\s]/);
    if (!alphas.test(e.key)) {
      e.preventDefault();
    }
  });

  lastName.addEventListener('blur', function (e) {
    if (e.target.validity.patternMismatch) {
      displayInputError(e.target, 'You can only have letters in your last name, ok?')
    } else {
      checkForError(e.target, 'Please provide a last name, ok?');
    }
  });


  lastName.addEventListener('keypress', function (e) {
    var alphas = new RegExp(/[a-zA-Z\s']/);
    if (!alphas.test(e.key)) {
      e.preventDefault();
    }
  });

  ccField.addEventListener('keypress', function (e) {
    var alphas = new RegExp(/[0-9]/);
    if (!alphas.test(e.key)) {
      e.preventDefault();
    }
  });

  ccField.addEventListener('keyup', function (e) {
    var nextCCInput = e.target.nextElementSibling;
    if (e.target.value.length === 4 && nextCCInput) {
      nextCCInput.focus();
    }
  });

  email.addEventListener('blur', function (e) {
    checkForError(e.target, 'Please provide a valid email, my friend');
  });

  password.addEventListener('blur', function (e) {
    if (e.target.validity.tooShort) {
      displayInputError(e.target, 'Password must be at least 10 characters, kiddo');
    } else {
      checkForError(e.target, 'Please provide a password, buddy');
    }
  });

  tel.addEventListener('blur', function (e) {
    checkForError(e.target, 'Please provide a valid phone number, thanks!!!');
  });


  validForm.addEventListener('focus', function (e) {
    var sib = e.target.nextElementSibling;
    if (sib && sib.tagName === 'P') {
      sib.remove();
    }
  }, true);

  validForm.addEventListener('blur', function (e) {
    if (error.style.display === 'block') {
      if (allValid()) {
        error.style.display = 'none';
      }
    }
  }, true);

  validForm.onsubmit = function (e) {
    e.preventDefault();
    var formdata = [];
    var ccn = 'cc='
    if (!allValid()) {
      error.style.display = 'block';
      showErrors();
    } else {
      var results = document.createElement('div');
      var resulthead = document.createElement('h3');
      var resultp = document.createElement('p');
      resulthead.textContent = 'Serialized Form';
      results.appendChild(resulthead);
      inputs.forEach(function (input) {
        if (input.value) {
          if (input.classList.contains('cc')) {
            ccn += input.value;
          } else {
            formdata.push(encodeURIComponent(input.id) + '=' + encodeURIComponent(input.value));
          }
        }
      });
      if (ccn !== 'cc=') {
        formdata.push(ccn);
      }

      resultp.textContent = formdata.join('&');
      results.appendChild(resultp);
      validForm.insertAdjacentElement('afterEnd', results);
    }
  };
});
