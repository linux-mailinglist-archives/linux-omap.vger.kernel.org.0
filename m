Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6FF155F7C
	for <lists+linux-omap@lfdr.de>; Fri,  7 Feb 2020 21:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgBGUUj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 Feb 2020 15:20:39 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38081 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726916AbgBGUUi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 7 Feb 2020 15:20:38 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so400309wrh.5
        for <linux-omap@vger.kernel.org>; Fri, 07 Feb 2020 12:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:subject:references:date:mime-version
         :content-transfer-encoding:from:message-id:in-reply-to:user-agent;
        bh=wOintdNO5qmOQ/OOnHt/kUReZvUtbEkfFW92H/d8TMo=;
        b=ObDpC7Ogck2QbVYZ7PNQnaoBTb4cpsU4RQTQ4MzfV3USG+n8srm53o8QoE/Sq/vyGq
         P6iRSEjEenKBcSxMwAYMEpcbR9JZCXToogVFpdkAwRy2+U9xRp6Grpqxg914YkNJIAsc
         XMdo0IlhHcMbuoeOp5GblyB0s+nDTkCEi5wi/0RQ4Bx0J1xxSS5EGfbh1xI/Qcoe1Sms
         XjbJCvyXlf4fVnvbpk8pKcc+VQb697p4X9u2blYP3Kp8jN+gOhnjpx01ELYva+IuhRLI
         UygL5YqyB5ILWOFwZaXNbY8eX8P8innyAXyUoU9Lbt7P7dZb9Qi4b+jfBH/qDr66AVrh
         CLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:subject:references:date:mime-version
         :content-transfer-encoding:from:message-id:in-reply-to:user-agent;
        bh=wOintdNO5qmOQ/OOnHt/kUReZvUtbEkfFW92H/d8TMo=;
        b=owpJtsoIB8H4YdD+z50mTbB3jqY1H/yM7Ujn16flLrbCZICDX65HEmrM305QYguKgC
         ZsqY08+asHbrS/0NoXGHsT8uv30CTlzjw4Xm1xU1we3Bnqq4Y2U5fkNJ5t/PLIHPBcjJ
         GSbZasFWME1nbqxJBJBLNU+RUDKKRJEdQ23gm7qWEzlc7a3YW1j551EDUeXQykBzTZSN
         Itq33MqfVootDI7ZD/RgQywSzoaFDNf9wU5gH6CiRFLiRztU/WgYjcutSzVmOFaAQZtY
         k8rj15cTOkX5dnFXsjU9WIoWViFbjiofR1DROmT3JW+NKZwS7QE9D6asiT6G/DyfSmly
         A56w==
X-Gm-Message-State: APjAAAX0np83wguyXJad7k8BQ6AOid3DdclO4t/aDKPut87jKQPswWr4
        D7wL9S1ga2dkzEtkidWNQeg=
X-Google-Smtp-Source: APXvYqyPa8jUTVKZIjoy2uatt/mdJ6UFxZPgw1fK+xL52XaA3AtSDz1XeDU21jzpebkL/WCI6NgBIw==
X-Received: by 2002:a5d:4b88:: with SMTP id b8mr712899wrt.343.1581106835759;
        Fri, 07 Feb 2020 12:20:35 -0800 (PST)
Received: from supervisor.net28 ([46.53.250.234])
        by smtp.gmail.com with ESMTPSA id r6sm4843020wrq.92.2020.02.07.12.20.34
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Feb 2020 12:20:34 -0800 (PST)
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
To:     "Merlijn Wajer" <merlijn@wizzup.org>,
        "Tony Lindgren" <tony@atomide.com>
Cc:     "Kees Cook" <keescook@chromium.org>,
        "Nicolas Pitre" <nico@fluxnic.net>,
        "Russell King" <rmk+kernel@armlinux.org.uk>,
        linux-omap <linux-omap@vger.kernel.org>,
        "Ivaylo Dimitrov" <ivo.g.dimitrov.75@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-arm-kernel@lists.infradead.org,
        "Aaro Koskinen" <aaro.koskinen@iki.fi>
Subject: Re: Nokia N900 on 5.4 and 5.5
References: <79b91017-b52a-8aff-4b9c-913ae655f7bf@wizzup.org>
 <185CD173-C13C-4D56-B3DE-9A8D7784963C@goldelico.com>
 <20200207163623.GA64767@atomide.com>
 <da14d6bb-f241-2dd4-8e94-886217a40ed7@wizzup.org>
 <20200207165344.GB64767@atomide.com> <20200207170149.GC64767@atomide.com>
Date:   Fri, 07 Feb 2020 23:20:33 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From:   "Arthur D." <spinal.by@gmail.com>
Message-ID: <op.0fmv4jevhxa7s4@supervisor.net28>
In-Reply-To: <20200207170149.GC64767@atomide.com>
User-Agent: Opera Mail/12.16 (Linux)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi.

I was able to build linux-5.5 and run it on N900 with no problems.
Even WiFi works, mmc0 is in place too. It seems you're doing something
wrong.

Were you able to build linux-5.1 with your scripts and run it on the
phone? I mean the pure linux-5.1 without configs and changes done
in https://github.com/maemo-leste/n9xx-linux.

BTW, I didn't find STACKPROTECTOR_PER_TASK option to be enabled in
omap2plus_defconfig.

--
Best regards, Spinal

> * Tony Lindgren <tony@atomide.com> [200207 16:54]:
>> * Merlijn Wajer <merlijn@wizzup.org> [200207 16:47]:
>> > On 07/02/2020 17:36, Tony Lindgren wrote:
>> > >
>> > > Looks like there's a regression in general for appended dtb booting  
>> that
>> > > was caused by commit 9f671e58159a ("security: Create "kernel  
>> hardening"
>> > > config area"). With that change we now get STACKPROTECTOR_PER_TASK
>> > > selected by default with Kconfig.
>> > >
>> > > Merlijn, care to try to disable STACKPROTECTOR_PER_TASK in your
>> > > .config to see if that helps?
>> >
>> > Yes, this makes the kernel boot.
>>
>> OK good to hear. My guess is that having STACKPROTECTOR_PER_TASK
>> selected causes changes to include/generated/asm-offsets.h that
>> appended dtb booting does not like. But let's see what others
>> think.
>
> I don't think this is an issue of CONFIG_STACKPROTECTOR + CONFIG_SMP
> booted on UP machine as it only happens with appended dtb it seems.
>
> Regards,
>
> Tony
