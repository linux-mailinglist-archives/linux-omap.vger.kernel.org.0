Return-Path: <linux-omap+bounces-2858-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 441149F76A9
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2024 09:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58A147A6D86
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2024 08:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B465D217F44;
	Thu, 19 Dec 2024 08:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+O14fEP"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A137B216E1B;
	Thu, 19 Dec 2024 08:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734595350; cv=none; b=phX96N5gMumVcSWiPtFhX3Xa8xqEFW6Zz77yn1wosXqDx1PdXKEf2BpWsaY3+gnexQT/JHCqK8cRzjjTyw4KOxt6IgsSQH0F6eL0frAR5BhDKtNsmp+8Sz+asJiepFyt9MdfXAO4VwdDRj1hhpQYZqiB4XBKE3YTZ5sudYZc27M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734595350; c=relaxed/simple;
	bh=ZTYdD4pv/FrP86RpFg0OdRmXKCaHeIGE7m8tYfbW6Mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cP9OYHB9nRRz9duI2fgPe1BP/0PGfAJGQqFkDomDaPFKACLZbx9ReoQATzSqnsgoSZsHKhYnEseOGPC3uyGnqvddsBhpuE+z7N65NmTj/cZK8VBNJ3nfO7srkT4bu9j82IkBYCpogm05NmR+5A+VYfgShyY04Bty69dKCstLZRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+O14fEP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4363ae65100so5052485e9.0;
        Thu, 19 Dec 2024 00:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734595347; x=1735200147; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pr0j3GNPYR2KJiDjiXq/FM0zHvlq9uUGD9iJKB2tA00=;
        b=c+O14fEPAV2ssUp/CGcC16hEB0LjUQaORdh+E+d3FiuGJELYX5nTZBa9l4xn1E0XL8
         5/o8IfZbT1Pn+vgZCGQCFaO7AdvZSqa4M844RvPB7PE1+2Y9bWPA7dWWfmoGZmy+YzLx
         2MqxOTzQzhj63IyeTiJHGB8DpX1nQQHWd1jWB4jO/yXyDw49dcbMTjvRl+IsM8moiQBL
         ZpeZSbQ+fia54InGY0ZojlkxvmcDDQY0oyQMqhpFzlhRwIY84sdBen7nl5mTj4KnFEd7
         Ov+/ikRk2K2jCRoSnayVW5OTUPXJGiy92DBzdnhcW3PaWb3S/kwQV+/KXqISm3GrOR8I
         mq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734595347; x=1735200147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pr0j3GNPYR2KJiDjiXq/FM0zHvlq9uUGD9iJKB2tA00=;
        b=sKF0kxtMkzx0kXwEIcFWdM6J4MAyhlZ8k3rEfaaKfIJm3tkb+IyBRUUCfhltPRVyoY
         mqLRPz6GsRKgA01VCEGEomYPFdFyUddQWIfd0hoWZeDNcHkoivsBZFmcwhrZRe+CBjyU
         6FL3+6Zm49Oyz4YGx2HyZP9BPMrbCU1Qz/a+QWg8Gc4T2ZXJmZSjphmHg+5AJxft1mD5
         LJTrzZwaHkG7vfjySuEHbzrToEMmbgCIwKbFhJZdnyvwQV3evJcC9VYAQLtnl/kwLyby
         btY/00ieqk43Z09WoSDiFtpdCRIYPS96FtA7Yw/8iDTmMSQIRfjr3BcvI3BJzTzOwbZu
         3Rrw==
X-Forwarded-Encrypted: i=1; AJvYcCU1+6fa7O+4YVrjSSb1+VinmRFXveWT4EGcCnpC0cN6vGFzFy8z+LSIP8ONeReBESbV5otkY9/QEiqBCJ1z@vger.kernel.org, AJvYcCUsD9n4r2o0MzFigWFPGqpp0AX5E95KyvgRhKPvT3z5p/kLxnrnLfxhxya7hsLfFmfYQwgxY4dSuK+r@vger.kernel.org, AJvYcCW4pHmbRss//jTBXcCENbu2e1ZjITq7oxt+c6ma/eUz0zj2gV3t962UKl5tMtxiXB0ntnDzpfOuh794Qw==@vger.kernel.org, AJvYcCW6E3PHzN85Dy1laKttc9U3Sz1OTXdZGf4l5ywfZBoRvoMDZWmh2Wfko2/bX+RIqOYzoCjG/dfCQnCcNQ1y@vger.kernel.org, AJvYcCWftJbgnRDissmJd2wNVn11NjWT7c4l1csubSaCueceDxvUnX0ztKxodHWiC6seTSolhHbsMzxD6Xl06eI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrV2aRZ2F7odfk5X1psyUMP3VGe8GPoz5mkRqhJDlKu80KLUnL
	usbhzXo+KewtapBhrGt6p+Nu/D59y+SPDXfod6mEIFI7uopRHvP1
X-Gm-Gg: ASbGncvA9RT6edn2fxxqeWkIYBI1m6onC2EaGx3W5+yty3xpNfpOAWu787w3xImd7hq
	mSx3nTFG+6HvGAB2I1ix4b5cTXNCrQQnzIfxeVMZoQKbf4R9bPtNAXuvd5SZXxdHdqckU2ot3xw
	CWqOlGgYV2F+gdvI+xQZK2XD7NoqMxnbT9VuX1wvhZAvYg+jWL2JwGkzXti4Dj5FZJ0Q/CevXnY
	MTNudth08ckcRM7zI54DhCRXmid69bE2how+/SZNOBQGHUJDeAlfeXkpN1NUUF92lZ65w==
X-Google-Smtp-Source: AGHT+IGmr4JM56+pjYIF/O4nGDJXOmCH3LeqOACcg7/BE8S+TR/RL97oz85ju9X97ong6RFgVQqvZQ==
X-Received: by 2002:a05:600c:364b:b0:436:18d0:aa6e with SMTP id 5b1f17b1804b1-4365c77dcdcmr17501225e9.5.1734595346504;
        Thu, 19 Dec 2024 00:02:26 -0800 (PST)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4366127c639sm10096975e9.31.2024.12.19.00.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 00:02:26 -0800 (PST)
Message-ID: <fa10cf03-ce8d-4fc4-a4fe-ea14c035825d@gmail.com>
Date: Thu, 19 Dec 2024 10:02:24 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] tty: n_gsm: Add support for serdev drivers
To: Jiri Slaby <jslaby@suse.cz>, Pavel Machek <pavel@ucw.cz>,
 Johan Hovold <johan@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
 Lee Jones <lee.jones@linaro.org>, Merlijn Wajer <merlijn@wizzup.org>,
 Peter Hurley <peter@hurleysoftware.com>, Sebastian Reichel <sre@kernel.org>,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20200512214713.40501-1-tony@atomide.com>
 <20200512214713.40501-2-tony@atomide.com> <20200528093102.GC10358@localhost>
 <20201129205144.GA15038@duo.ucw.cz>
 <b9220ab2-0992-41d0-abef-f9ec6e306af1@gmail.com>
 <dcdc22f2-587e-4879-a987-71c92c0149e9@suse.cz>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <dcdc22f2-587e-4879-a987-71c92c0149e9@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 19.12.24 г. 9:53 ч., Jiri Slaby wrote:
> On 19. 12. 24, 8:45, Ivaylo Dimitrov wrote:
>> Hi,
>>
>> ...
>>
>> On 29.11.20 г. 22:51 ч., Pavel Machek wrote:
>>>>
>>>> It looks like you may also have a problem with tty hangups, which 
>>>> serdev
>>>> does not support currently. There are multiple paths in n_gsm which can
>>>> trigger a hangup (e.g. based on remote input) and would likely lead 
>>>> to a
>>>> crash
>>>
>>> I don't believe we need to support hangups for the Droid 4, but
>>> obviously it would be good not to crash. But I don't know where to
>>> start looking, do you have any hints?
>>>
>>
>> I changed the patch so it calls tty_port_register_device_serdev, 
>> ported gnss driver to use serdev_device, got it working:
>>
>> root@devuan-droid4:~# cat /dev/gnss0
>> $GPGGA,,,,,,0,,,,,,,,*66
>> $GNGNS,,,,,,NN,,,,,,*53
>> $GNGNS,,,,,,NN,,,,,,*53
>> $GNGNS,,,,,,NN,,,,,,*53
>> $GPVTG,,T,,M,,N,,K,N*2C
>> $GPRMC,,V,,,,,,,,,,N*53
>> $GPGSA,A,1,,,,,,,,,,,,,,,*1E
>> $GLGSV,1,1,01,255,,,37*52
>> $GPGGA,,,,,,0,,,,,,,,*66
>> $GNGNS,,,,,,NN,,,,,,*53
>> $GNGNS,,,,,,NN,,,,,,*53
>> $GNGNS,,,,,,NN,,,,,,*53
>>
>> However, I get:
>>
>> gsmtty gsmtty4: tty_hangup: tty->count(1) != (#fd's(0) + #kopen's(0))
>>
>> when closing /dev/gnss0
>>
>> Any hint what shall be implemented in serdev to properly handle hangups? 
> 
> Without code, no.

Which code? The $subject patch with changes I made? or gnss driver? both?

Thanks,
Ivo

