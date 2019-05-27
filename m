Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4644F2B8A9
	for <lists+linux-omap@lfdr.de>; Mon, 27 May 2019 18:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfE0QDZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 May 2019 12:03:25 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40197 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfE0QDZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 May 2019 12:03:25 -0400
Received: by mail-wr1-f68.google.com with SMTP id t4so9051416wrx.7
        for <linux-omap@vger.kernel.org>; Mon, 27 May 2019 09:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2TYRQV/8vy5n7AkTEmZf5fs246F6UHHh7ITNZBQ2EdM=;
        b=Y6uIRPiDReIDHM0p+LxtmG9toj0Q4Fw0qSc2uJLjJeOMxpx9RP5OOa36jsdzDnfNtG
         A0zPQj6hjaiIzFtMadY8AFecnooo21a4N9TuD/MEJjd5MVceXS4gTyVR0AyU38ELZNp/
         YZV1wzTzf23MUMyesf3aOtN8ZFA7pPl+PA1lf8GrFJdl5JW2YU50HCoufxPC37fZGvnG
         nFQXkldbXTDzjDoj8wYGBYimzUAbOMZCcdCSVHQwhBEVRxNhfY+RZDmINnD6hG/KE0Fu
         lfqOzC+Iv4zbFo+BosT0fUhFu0Oz4mD3DFUilcfah6n2Kb1EqLwhwGzhKR0zlhog8dmT
         gkCQ==
X-Gm-Message-State: APjAAAXvrXyyOvonXQcOXPfnleEHky/oAI53dyya2YjNv6CFEOwbfeYQ
        J/lB1E0tuwurpAze9+N0sz0ITA==
X-Google-Smtp-Source: APXvYqwT2b/6FC4cJVZGNdWcdbbsNERf/3B12TaNX+gUgYXRWPEXC9eJwz0FLxEkCRuK1jUYHdIfoQ==
X-Received: by 2002:a5d:6108:: with SMTP id v8mr19005476wrt.150.1558973003585;
        Mon, 27 May 2019 09:03:23 -0700 (PDT)
Received: from [192.168.1.43] (228.red-83-52-173.dynamicip.rima-tde.net. [83.52.173.228])
        by smtp.gmail.com with ESMTPSA id a128sm12214045wma.23.2019.05.27.09.03.21
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 09:03:22 -0700 (PDT)
Subject: Re: [Qemu-devel] Running linux on qemu omap
To:     Guenter Roeck <linux@roeck-us.net>,
        Tony Lindgren <tony@atomide.com>
Cc:     Thomas Huth <thuth@redhat.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        linux-omap@vger.kernel.org, qemu-devel@nongnu.org,
        linux-kernel@vger.kernel.org,
        Peter Maydell <peter.maydell@linaro.org>
References: <20190520190533.GA28160@Red>
 <20190521232323.GD3621@darkstar.musicnaut.iki.fi>
 <20190522093341.GA32154@Red>
 <20190522181904.GE3621@darkstar.musicnaut.iki.fi>
 <8977e2bb-8d9e-f4fd-4c44-b4f67e0e7314@redhat.com>
 <c2972889-fe60-7614-fb6e-e57ddf780a54@redhat.com>
 <20190527063250.GI5447@atomide.com>
 <5dbec436-4356-415e-eb1c-0f506af89744@roeck-us.net>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <55b06c4c-5963-d4ef-4dcf-b222786bfd52@redhat.com>
Date:   Mon, 27 May 2019 18:03:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5dbec436-4356-415e-eb1c-0f506af89744@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 5/27/19 5:56 PM, Guenter Roeck wrote:
> On 5/26/19 11:32 PM, Tony Lindgren wrote:
>> Hi,
>>
>> * Philippe Mathieu-Daudé <philmd@redhat.com> [190523 12:01]:
>>> What I use as reference for testing ARM boards [*] is the work of
>>> Guenter Roeck:
>>> https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/run-qemu-arm.sh
>>>
>>
>> I think Guenter also has v2.3.50-local-linaro branch in his
>> github repo that has support for few extra boards like Beagleboard.
>> Not sure what's the current branch to use though.
>>
> I'd be happy to use a different (supported) branch, but the Linaro branch
> was the only one I could find that supports those boards. Unfortunately,
> qemu changed so much since 2.3 that it is all but impossible to merge
> the code into mainline qemu without spending a lot of effort on it.

Peter commented on that here:
https://lists.gnu.org/archive/html/qemu-devel/2015-05/msg00137.html

"This is not a trivial job (my estimate was that it would be a couple
of months work to get the complete set sorted out and upstreamed ..."
