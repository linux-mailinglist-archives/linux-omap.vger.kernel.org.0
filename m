Return-Path: <linux-omap+bounces-2856-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5C79F7606
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2024 08:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 828FB189802D
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2024 07:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F062157A72;
	Thu, 19 Dec 2024 07:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0iu4QfA"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DFB2163A9;
	Thu, 19 Dec 2024 07:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594363; cv=none; b=sldK+d/xOdeKojuYWwV5QM7MrkN4Il5HHIQp4FTjCtoIoCpMNbNVgbSN2SoP3zhwHS9KMHM0V2S6Gzr6ruFn46/3RApX1bzXWMLkmUzho/rFOeYlCuvtPMHTc423lqC7Ju3kGOlpQP4UVMwiBuKaLtTJ+rfKo6NRG5SFv08hfqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594363; c=relaxed/simple;
	bh=oP5teu4dAVEO/gKhR/xdQlvE9CI9kDiN4WDPbO1YnrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LX9q4SSqw/7Yv1XzEsTn4LMKuLlozeEgUgzWPNNGL3opdje4IuW/jx/2/ZcHPbJH9E9toY5qWeO3DZrMUzaVUuEkvZbH84bSTygi9+sFLyweLqnShBXo7wXxGr8VT4Yl+1BV9mLHuFYNj9mLxETjIwy7Yqu/JFRDkxFvlmPxTq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0iu4QfA; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e06af753so243325f8f.2;
        Wed, 18 Dec 2024 23:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734594359; x=1735199159; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZM+QxhLRSlEDIbK525i5yp4y3A6mGOecqumrW65Ovo=;
        b=A0iu4QfAF0LvhI+A0N1lypHOVxpLuwqEm9jmWm5asKsboH/NCmmNrcVsvffjA2lYkM
         9KmSpv9U6pofikmZAeZDMRDx5ueH18Zs23J5PKtGr6hH45dKs1DLTFd9xayx6szzLRlp
         F2DdMqMe7JJsWVuawiX+0c1xswsuxxJ2Bad8i2bqnnKfyfS4TGX7Jrthm1RbvtY7lXyO
         CPw6htYgafInbpxeykuzgqWW0Q806m7LfVFfnUsoSOSFzUm7Wgu3tZbj8wwyBOe+InEV
         pY/Fdtba7jB/v1LYOzbWht3xVJ0hN+uDfsw8MJ9TTIfmtLWVkBr+rmaSJ4Zs01v6cdnj
         hpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594359; x=1735199159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QZM+QxhLRSlEDIbK525i5yp4y3A6mGOecqumrW65Ovo=;
        b=h5nmqALutcBkL2U5ymsu6L58q8hcQwQRuWCq6YjruwmZRJxzWUyKh+4jf5nSUqkG2A
         XG+c5lea0WyRt+c4J9s9EOyqCAyhqg1vdaYwDz7okurNMnFHanUlb7MtotH4lUi3H9ml
         FpcK0aHDy4JAfZDrAeR3Td8RYw8NvMfHGqLZ/0JRWSVb5rihvY40+zZJxWhzYdgXJP9O
         SFcH7Kgfk75r9dSrXqhl6wYrBMVQQNcwLjOhfa6+DdT2oFdqWQaJlrEusJ/Cq9PqMH5S
         FWFUWm1w9N8oCWwbyf1RcN+MNBu8oO0sedNVBsi/DsXGQroqAIsq9FT41V31OatlrK/B
         /eKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNjba/VQKThmjYaLWY0xNnuvHkv8tkeWPpLYYbvkqNofmeT2V3xq9Zw1fImhewCCVjTNhVX3LOGvNdoJL8@vger.kernel.org, AJvYcCV/VuvovKUzmCGyhMxQHB4p6x88UQrvws2IJsKFHeuRfoQBTSeBBj4V8bvaQf0T3bgrye23swW2VxNpoig=@vger.kernel.org, AJvYcCVf+BTaKLtZtIxz/f8K/ENz52YSpIsE2bawad67ru3chP3cQwIRw68qu2v9jAUmS5QmjvP/ttuzrKRA@vger.kernel.org, AJvYcCVoXOWyBVyuxecQ8ES8Kno3yEdXRptjfN4kyS6I5jVQr4Pj4hB8FcaMFBzWmdKzmsGsy/qHvcD2oSAaJ1dI@vger.kernel.org, AJvYcCWeG9KneR6zK7eLwPRf3qYRjnG3w5F5AUOEVJHgYFh0d5nVPLDUBbkN0sPfC9IouTfr1UVAxigSS2ocwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1aImcaxVJr8bQ8R02PG7wIQe7b+KPKFF/H5Ysq57QZvvy4vSe
	qABbrbAwk2M0TyshvHuEyc7VpMoorDyLsJNDHiyQIRBG1EPssQaB
X-Gm-Gg: ASbGnctHXJcq6cI0fSWvwhwMqMTa4eEZEHssuDe3bwppI+7hpS8tO4GL4zpp4J7TLX1
	XK0G4TG1Rfp9KI94r/hdf4MFtrPMMqQIKis9ZFbcfGJKLXwLZvCIZquCRh0LEAH5Fncn8g3FI/S
	ccZ84hXjFbfhxL85NmU6L8dhSPQNDfybAhTdBGpv/50Rr6VrfGhc33h7Ynj8XLQaDNnUbjibMy1
	xBmQqpl5da278hctRAsWl5Ep+XakHi9wM80yrBq+K9U8TzaxWih+GNsODXve24qU7fk+Q==
X-Google-Smtp-Source: AGHT+IFsoM61V0joaKHqVc4PbvJqDSLkddTcQASbEuaO4DVFiG7iQND5F6fjo4oTT30j0Clqz9fEIQ==
X-Received: by 2002:a05:6000:18a5:b0:385:f7a3:fed1 with SMTP id ffacd0b85a97d-388e4dae6d6mr5642139f8f.44.1734594359217;
        Wed, 18 Dec 2024 23:45:59 -0800 (PST)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4364b14f241sm65398125e9.1.2024.12.18.23.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 23:45:58 -0800 (PST)
Message-ID: <b9220ab2-0992-41d0-abef-f9ec6e306af1@gmail.com>
Date: Thu, 19 Dec 2024 09:45:56 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] tty: n_gsm: Add support for serdev drivers
To: Pavel Machek <pavel@ucw.cz>, Johan Hovold <johan@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
 Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
 Merlijn Wajer <merlijn@wizzup.org>, Peter Hurley <peter@hurleysoftware.com>,
 Sebastian Reichel <sre@kernel.org>, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, phone-devel@vger.kernel.org
References: <20200512214713.40501-1-tony@atomide.com>
 <20200512214713.40501-2-tony@atomide.com> <20200528093102.GC10358@localhost>
 <20201129205144.GA15038@duo.ucw.cz>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <20201129205144.GA15038@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

...

On 29.11.20 г. 22:51 ч., Pavel Machek wrote:
>>
>> It looks like you may also have a problem with tty hangups, which serdev
>> does not support currently. There are multiple paths in n_gsm which can
>> trigger a hangup (e.g. based on remote input) and would likely lead to a
>> crash
> 
> I don't believe we need to support hangups for the Droid 4, but
> obviously it would be good not to crash. But I don't know where to
> start looking, do you have any hints?
> 

I changed the patch so it calls tty_port_register_device_serdev, ported 
gnss driver to use serdev_device, got it working:

root@devuan-droid4:~# cat /dev/gnss0
$GPGGA,,,,,,0,,,,,,,,*66
$GNGNS,,,,,,NN,,,,,,*53
$GNGNS,,,,,,NN,,,,,,*53
$GNGNS,,,,,,NN,,,,,,*53
$GPVTG,,T,,M,,N,,K,N*2C
$GPRMC,,V,,,,,,,,,,N*53
$GPGSA,A,1,,,,,,,,,,,,,,,*1E
$GLGSV,1,1,01,255,,,37*52
$GPGGA,,,,,,0,,,,,,,,*66
$GNGNS,,,,,,NN,,,,,,*53
$GNGNS,,,,,,NN,,,,,,*53
$GNGNS,,,,,,NN,,,,,,*53

However, I get:

gsmtty gsmtty4: tty_hangup: tty->count(1) != (#fd's(0) + #kopen's(0))

when closing /dev/gnss0

Any hint what shall be implemented in serdev to properly handle hangups? 
Or, shall I ignore that warning?

Regards,
Ivo

