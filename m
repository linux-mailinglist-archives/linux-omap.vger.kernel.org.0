Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61C112B8A2
	for <lists+linux-omap@lfdr.de>; Mon, 27 May 2019 17:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfE0P44 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 May 2019 11:56:56 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38563 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbfE0P44 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 May 2019 11:56:56 -0400
Received: by mail-pf1-f195.google.com with SMTP id b76so9790288pfb.5;
        Mon, 27 May 2019 08:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=d6VSBFNBtAbJpYlBgVyHpiunnCtg5nq2DJVgA1pCtMA=;
        b=jtkyvqMqsBJBDfI+8Vyo9jx8Zu56SQR9OU96Wf8gn9qcqPL0dhirCkWpHS9Q4LJoTf
         FnH8J7xFslp71OCeVd9OTKi8nuockChFDcyvMwY+XFnuRkpQxiIqaHPUQmH8Ntgxre28
         x4Oec5b+wAAR8zX6mcArnvX7vfKrhwnrSaPsJ3bCJKlEq18rF5RLNbXP6gPlyeiDXYrB
         VXYyXqsv57vT/jHgAOa1epzDJ68BPcIOjp2CM5usrOM5vvJTAnOVKdBPIDxGYWmmC3tW
         YZ7KnYA5eI2kVA2HU2NDd+Pv9KQKc/YaSYmKqYaBcHrPovVeZ+NBUd8MBdkq5ABBuPSH
         0u8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d6VSBFNBtAbJpYlBgVyHpiunnCtg5nq2DJVgA1pCtMA=;
        b=W+aNhwTKE+AssN2x/6Yzs5a1/AEMSBzqgznGr1vqgB5q3oKHq39h0weOIzpyC0XflW
         Aj6v/dVSbJ9v55skCTixoEcc3WSJIdmCYvzVDED4Iu3nqpNPa8A5ruPP635YREc+bqjv
         KPSQlpVp/liAE2nc7yuhhFcFIHytGIWTxvZrLec22v8mCQlOzBy4MXjEzOQrKrg4bSpX
         vjagmhQV9SGzzuYAl1M2ERr0IYfJUA1Qe0m93rDDCr7m3DAHc44yf1DQTNjgz3JAcLYR
         te8v8u7iYm8ZemktTaxNui00sDoZ5cXuiLtLe4PSJi6cS9YoYk7gTRkfXxMH6rijZr2g
         9h4w==
X-Gm-Message-State: APjAAAUKZqyWnNmlQ02K0/LkAXsaOtaUX0HamGrnC+nhF/XM4xX//W3S
        0GgnDWXThPhEsqKMezsc3F08EkKI
X-Google-Smtp-Source: APXvYqwcAY5U9y/EHrI4RzsmJwHSIzREkHux5n+Pnh+rJpV8l5dRNU8u/Pmwj5d1E4tkhpXhbdMBcw==
X-Received: by 2002:a17:90a:b393:: with SMTP id e19mr32693682pjr.91.1558972615422;
        Mon, 27 May 2019 08:56:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q70sm19541411pja.31.2019.05.27.08.56.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 08:56:54 -0700 (PDT)
Subject: Re: [Qemu-devel] Running linux on qemu omap
To:     Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
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
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <5dbec436-4356-415e-eb1c-0f506af89744@roeck-us.net>
Date:   Mon, 27 May 2019 08:56:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190527063250.GI5447@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 5/26/19 11:32 PM, Tony Lindgren wrote:
> Hi,
> 
> * Philippe Mathieu-Daudé <philmd@redhat.com> [190523 12:01]:
>> What I use as reference for testing ARM boards [*] is the work of
>> Guenter Roeck:
>> https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/run-qemu-arm.sh
> 
> I think Guenter also has v2.3.50-local-linaro branch in his
> github repo that has support for few extra boards like Beagleboard.
> Not sure what's the current branch to use though.
> 
I'd be happy to use a different (supported) branch, but the Linaro branch
was the only one I could find that supports those boards. Unfortunately,
qemu changed so much since 2.3 that it is all but impossible to merge
the code into mainline qemu without spending a lot of effort on it.

Guenter
