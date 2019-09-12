Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9298CB15C3
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 23:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbfILVMY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 17:12:24 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39545 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728362AbfILVMX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 17:12:23 -0400
Received: by mail-wr1-f67.google.com with SMTP id t16so29923422wra.6
        for <linux-omap@vger.kernel.org>; Thu, 12 Sep 2019 14:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nDmlyaItp1qyTrUinPm/iBhMHherQjJOfS+VkG+TJog=;
        b=Lcg0VVQIw1AMg6TQc7mUwriMpIlkPGezSCZzmzwMaLJ2UQ19sPZhlNA0RIBbcJ/VV2
         aVOTtfx7aTg+6RK+YnOQ/DKEXSBwPsXCSjNbeBCgPbRPn76jiO8v961f3Dw6DQ1fta+y
         63inMNsoNWS3x4Nl4Aji8Zvreo4vNHGvAjzk+QQH34aI0NW3X5lVofiApf+eaT4nI+Gk
         5XwSfk2XBBzJhr7miZP+seUmaqMSAGCCxpNtkwPA2qm+/ohgl8kyh17/PXRDm4rJsMGF
         yKTGXleoKAPj/nXOmtfUrWWTOiGDC//4XbbBCOtDrYLn/2kZp6IQScazfFVj3OwRPMhT
         +KEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=nDmlyaItp1qyTrUinPm/iBhMHherQjJOfS+VkG+TJog=;
        b=Eal65B1QdCvf6sV0PgHxMg65rD7m8p2PJTzG9JiN6ohncCuZ4CxREuGJ3MFUEdmU6s
         LeqcC7y+WIfs4HC0mNAmqnJ4SzRJoNl9/KC5y4vt4wpIow1/RbgGANqXtnBN8ia9ODNl
         ZlyC8BEgCXtl6IO44ofz4L6F2zQYEtOwSpQMghj+flUBuDXbLV4qY31dHnTutOQ67dIT
         SGqP7CzYQsJmQj5JYLoWidLEG3e84MnE82RXJzCf5O9lzFieT6CXEUijMsZKo6L98cv9
         /SNXVoWH40i2MWWg8NctjCSJHZXISlBKIIk2dAUbZR6hrHAdycOA5iJsuh8VDehbDl6u
         m0lw==
X-Gm-Message-State: APjAAAXEnciGE+mTY9b8/PoSeN8wlYymaTqfCobpapuADYXLVjDkBbRe
        14v8qY3xkq0f0k7NAvclcY5wCg==
X-Google-Smtp-Source: APXvYqy1919B2UlKzs61aTtNwe5fqE9BgBsCNUpRGvAlxFXbOFTbEVAvK/bHaZc+sXPwZJNnfUuMCw==
X-Received: by 2002:a5d:458b:: with SMTP id p11mr34966912wrq.160.1568322740246;
        Thu, 12 Sep 2019 14:12:20 -0700 (PDT)
Received: from [192.168.3.203] ([148.69.85.38])
        by smtp.googlemail.com with ESMTPSA id e20sm51662113wrc.34.2019.09.12.14.12.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Sep 2019 14:12:19 -0700 (PDT)
Subject: Re: [RFC] ARM: dts: omap36xx: Enable thermal throttling
To:     Adam Ford <aford173@gmail.com>, linux-omap@vger.kernel.org
Cc:     hns@goldelico.com, tony@atomide.com, neolynx@gmail.com,
        letux-kernel@openphoenux.org, linux-kernel@vger.kernel.org,
        andreas@kemnade.info, nm@ti.com, adam.ford@logicpd.com
References: <20190912183037.18449-1-aford173@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 mQINBFv/yykBEADDdW8RZu7iZILSf3zxq5y8YdaeyZjI/MaqgnvG/c3WjFaunoTMspeusiFE
 sXvtg3ehTOoyD0oFjKkHaia1Zpa1m/gnNdT/WvTveLfGA1gH+yGes2Sr53Ht8hWYZFYMZc8V
 2pbSKh8wepq4g8r5YI1XUy9YbcTdj5mVrTklyGWA49NOeJz2QbfytMT3DJmk40LqwK6CCSU0
 9Ed8n0a+vevmQoRZJEd3Y1qXn2XHys0F6OHCC+VLENqNNZXdZE9E+b3FFW0lk49oLTzLRNIq
 0wHeR1H54RffhLQAor2+4kSSu8mW5qB0n5Eb/zXJZZ/bRiXmT8kNg85UdYhvf03ZAsp3qxcr
 xMfMsC7m3+ADOtW90rNNLZnRvjhsYNrGIKH8Ub0UKXFXibHbafSuq7RqyRQzt01Ud8CAtq+w
 P9EftUysLtovGpLSpGDO5zQ++4ZGVygdYFr318aGDqCljKAKZ9hYgRimPBToDedho1S1uE6F
 6YiBFnI3ry9+/KUnEP6L8Sfezwy7fp2JUNkUr41QF76nz43tl7oersrLxHzj2dYfWUAZWXva
 wW4IKF5sOPFMMgxoOJovSWqwh1b7hqI+nDlD3mmVMd20VyE9W7AgTIsvDxWUnMPvww5iExlY
 eIC0Wj9K4UqSYBOHcUPrVOKTcsBVPQA6SAMJlt82/v5l4J0pSQARAQABtCpEYW5pZWwgTGV6
 Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz6JAlcEEwEIAEECGwEFCwkIBwIGFQoJ
 CAsCBBYCAwECHgECF4ACGQEWIQQk1ibyU76eh+bOW/SP9LjScWdVJwUCXAkeagUJDRnjhwAK
 CRCP9LjScWdVJ+vYEACStDg7is2JdE7xz1PFu7jnrlOzoITfw05BurgJMqlvoiFYt9tEeUMl
 zdU2+r0cevsmepqSUVuUvXztN8HA/Ep2vccmWnCXzlE56X1AK7PRRdaQd1SK/eVsJVaKbQTr
 ii0wjbs6AU1uo0LdLINLjwwItnQ83/ttbf1LheyN8yknlch7jn6H6J2A/ORZECTfJbG4ecVr
 7AEm4A/G5nyPO4BG7dMKtjQ+crl/pSSuxV+JTDuoEWUO+YOClg6azjv8Onm0cQ46x9JRtahw
 YmXdIXD6NsJHmMG9bKmVI0I7o5Q4XL52X6QxkeMi8+VhvqXXIkIZeizZe5XLTYUvFHLdexzX
 Xze0LwLpmMObFLifjziJQsLP2lWwOfg6ZiH8z8eQJFB8bYTSMqmfTulB61YO0mhd676q17Y7
 Z7u3md3CLH7rh61wU1g7FcLm9p5tXXWWaAud9Aa2kne2O3sirO0+JhsKbItz3d9yXuWgv6w3
 heOIF0b91JyrY6tjz42hvyjxtHywRr4cdAEQa2S7HeQkw48BQOG6PqQ9d3FYU34pt3WFJ19V
 A5qqAiEjqc4N0uPkC79W32yLGdyg0EEe8v0Uhs3CxM9euGg37kr5fujMm+akMtR1ENITo+UI
 fgsxdwjBD5lNb/UGodU4QvPipB/xx4zz7pS5+2jGimfLeoe7mgGJxrkBDQRb/8z6AQgAvSkg
 5w7dVCSbpP6nXc+i8OBz59aq8kuL3YpxT9RXE/y45IFUVuSc2kuUj683rEEgyD7XCf4QKzOw
 +XgnJcKFQiACpYAowhF/XNkMPQFspPNM1ChnIL5KWJdTp0DhW+WBeCnyCQ2pzeCzQlS/qfs3
 dMLzzm9qCDrrDh/aEegMMZFO+reIgPZnInAcbHj3xUhz8p2dkExRMTnLry8XXkiMu9WpchHy
 XXWYxXbMnHkSRuT00lUfZAkYpMP7La2UudC/Uw9WqGuAQzTqhvE1kSQe0e11Uc+PqceLRHA2
 bq/wz0cGriUrcCrnkzRmzYLoGXQHqRuZazMZn2/pSIMZdDxLbwARAQABiQI2BBgBCAAgFiEE
 JNYm8lO+nofmzlv0j/S40nFnVScFAlv/zPoCGwwACgkQj/S40nFnVSf4OhAAhWJPjgUu6VfS
 mV53AUGIyqpOynPvSaMoGJzhNsDeNUDfV5dEZN8K4qjuz2CTNvGIyt4DE/IJbtasvi5dW4wW
 Fl85bF6xeLM0qpCaZtXAsU5gzp3uT7ut++nTPYW+CpfYIlIpyOIzVAmw7rZbfgsId2Lj7g1w
 QCjvGHw19mq85/wiEiZZNHeJQ3GuAr/uMoiaRBnf6wVcdpUTFMXlkE8/tYHPWbW0YKcKFwJ3
 uIsNxZUe6coNzYnL0d9GK2fkDoqKfKbFjNhW9TygfeL2Qhk949jMGQudFS3zlwvN9wwVaC0i
 KC/D303DiTnB0WFPT8CltMAZSbQ1WEWfwqxhY26di3k9pj+X3BfOmDL9GBlnRTSgwjqjqzpG
 VZsWouuTfXd9ZPPzvYdUBrlTKgojk1C8v4fhSqb+ard+bZcwNp8Tzl/EI9ygw6lYEATGCUYI
 Wco+fjehCgG1FWvWavMU+jLNs8/8uwj1u+BtRpWFj4ug/VaDDIuiApKPwl1Ge+zoC7TLMtyb
 c00W5/8EckjmNgLDIINEsOsidMH61ZOlwDKCxo2lbV+Ij078KHBIY76zuHlwonEQaHLCAdqm
 WiI95pYZNruAJEqZCpvXDdClmBVMZRDRePzSljCvoHxn7ArEt3F14mabn2RRq/hqB8IhC6ny
 xAEPQIZaxxginIFYEziOjR65AQ0EW//NCAEIALcJqSmQdkt04vIBD12dryF6WcVWYvVwhspt
 RlZbZ/NZ6nzarzEYPFcXaYOZCOCv+Xtm6hB8fh5XHd7Y8CWuZNDVp3ozuqwTkzQuux/aVdNb
 Fe4VNeKGN2FK1aNlguAXJNCDNRCpWgRHuU3rWwGUMgentJogARvxfex2/RV/5mzYG/N1DJKt
 F7g1zEcQD3JtK6WOwZXd+NDyke3tdG7vsNRFjMDkV4046bOOh1BKbWYu8nL3UtWBxhWKx3Pu
 1VOBUVwL2MJKW6umk+WqUNgYc2bjelgcTSdz4A6ZhJxstUO4IUfjvYRjoqle+dQcx1u+mmCn
 8EdKJlbAoR4NUFZy7WUAEQEAAYkDbAQYAQgAIBYhBCTWJvJTvp6H5s5b9I/0uNJxZ1UnBQJb
 /80IAhsCAUAJEI/0uNJxZ1UnwHQgBBkBCAAdFiEEGn3N4YVz0WNVyHskqDIjiipP6E8FAlv/
 zQgACgkQqDIjiipP6E+FuggAl6lkO7BhTkrRbFhrcjCm0bEoYWnCkQtX9YFvElQeA7MhxznO
 BY/r1q2Uf6Ifr3YGEkLnME/tQQzUwznydM94CtRJ8KDSa1CxOseEsKq6B38xJtjgYSxNdgQb
 EIfCzUHIGfk94AFKPdV6pqqSU5VpPUagF+JxiAkoEPOdFiQCULFNRLMsOtG7yp8uSyJRp6Tz
 cQ+0+1QyX1krcHBUlNlvfdmL9DM+umPtbS9F6oRph15mvKVYiPObI1z8ymHoc68ReWjhUuHc
 IDQs4w9rJVAyLypQ0p+ySDcTc+AmPP6PGUayIHYX63Q0KhJFgpr1wH0pHKpC78DPtX1a7HGM
 7MqzQ4NbD/4oLKKwByrIp12wLpSe3gDQPxLpfGgsJs6BBuAGVdkrdfIx2e6ENnwDoF0Veeji
 BGrVmjVgLUWV9nUP92zpyByzd8HkRSPNZNlisU4gnz1tKhQl+j6G/l2lDYsqKeRG55TXbu9M
 LqJYccPJ85B0PXcy63fL9U5DTysmxKQ5RgaxcxIZCM528ULFQs3dfEx5euWTWnnh7pN30RLg
 a+0AjSGd886Bh0kT1Dznrite0dzYlTHlacbITZG84yRk/gS7DkYQdjL8zgFr/pxH5CbYJDk0
 tYUhisTESeesbvWSPO5uNqqy1dAFw+dqRcF5gXIh3NKX0gqiAA87NM7nL5ym/CNpJ7z7nRC8
 qePOXubgouxumi5RQs1+crBmCDa/AyJHKdG2mqCt9fx5EPbDpw6Zzx7hgURh4ikHoS7/tLjK
 iqWjuat8/HWc01yEd8rtkGuUcMqbCi1XhcAmkaOnX8FYscMRoyyMrWClRZEQRokqZIj79+PR
 adkDXtr4MeL8BaB7Ij2oyRVjXUwhFQNKi5Z5Rve0a3zvGkkqw8Mz20BOksjSWjAF6g9byukl
 CUVjC03PdMSufNLK06x5hPc/c4tFR4J9cLrV+XxdCX7r0zGos9SzTPGNuIk1LK++S3EJhLFj
 4eoWtNhMWc1uiTf9ENza0ntqH9XBWEQ6IA1gubCniGG+Xg==
Message-ID: <51bb8890-bfd7-c241-1ce5-151df3a90513@linaro.org>
Date:   Thu, 12 Sep 2019 23:12:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912183037.18449-1-aford173@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/09/2019 20:30, Adam Ford wrote:
> The thermal sensor in the omap3 family isn't accurate, but it's
> better than nothing.  The various OPP's enabled for the omap3630
> support up to OPP1G, however the datasheet for the DM3730 states
> that OPP130 and OPP1G are not available above TJ of 90C.
> 
> This patch configures the thermal throttling to limit the
> operating points of the omap3630 to Only OPP50 and OPP100 if
> the thermal sensor reads a value above 90C.

Out of curiosity, what are the OPP50 and OPP100 mentioned above? and
what does mean "OPP130 and OPP1G are not available above TJ of 90C"?

I don't see the connection between these OPP names and the definition in
the DT.

> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
> index 4bb4f534afe2..58b9d347019f 100644
> --- a/arch/arm/boot/dts/omap36xx.dtsi
> +++ b/arch/arm/boot/dts/omap36xx.dtsi
> @@ -25,6 +25,7 @@
>  
>  			vbb-supply = <&abb_mpu_iva>;
>  			clock-latency = <300000>; /* From omap-cpufreq driver */
> +			#cooling-cells = <2>;
>  		};
>  	};
>  
> @@ -195,6 +196,31 @@
>  	};
>  };
>  
> +&cpu_thermal {
> +	cpu_trips: trips {
> +		/* OPP130 and OPP1G are not available above TJ of 90C. */
> +		cpu_alert0: cpu_alert {
> +			temperature = <90000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "passive";
> +		};
> +
> +		cpu_crit: cpu_crit {
> +			temperature = <125000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "critical";
> +		};
> +	};
> +
> +	cpu_cooling_maps: cooling-maps {
> +		map0 {
> +			trip = <&cpu_alert0>;
> +			/* Only allow OPP50 and OPP100 */
> +			cooling-device = <&cpu 0 1>;
> +		};
> +	};
> +};
> +
>  /* OMAP3630 needs dss_96m_fck for VENC */
>  &venc {
>  	clocks = <&dss_tv_fck>, <&dss_96m_fck>;
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

