Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A5BB607D
	for <lists+linux-omap@lfdr.de>; Wed, 18 Sep 2019 11:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbfIRJhw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Sep 2019 05:37:52 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52541 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727588AbfIRJhw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 18 Sep 2019 05:37:52 -0400
Received: by mail-wm1-f68.google.com with SMTP id x2so1761576wmj.2
        for <linux-omap@vger.kernel.org>; Wed, 18 Sep 2019 02:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZdAuP46YLKqTOLi0uur7CjQAOUg/pSNs3mCa7ArEgbM=;
        b=BvtwiXJkRERNmySggar5YIgG8x4EZj0pug2UGF8fdD99WMod+L4Mbku0b+ppbK0K9n
         wmsv9qo/Qi9IZ8Vq35XtCLyo/pIaWhnLkgkq/yUJQo49LfXo2RksQ4fTuMgYgREWTSmT
         H8j1ncdZ0f8h4pNb8VsedqB+7hLS4rugHw8PIFDw3kHt9Sij7lDsYzZQ4qRG0zL274he
         4p4PoggEJBX8/Dkg0c0Vk2WLf5jutJytIA4Mn+OjCFpyL6XXMDZcd2QcHtqQqzehWNEg
         vNWta7cUeNSNNyKckgvDeKegjAHffgqmfHhJzAM6uYDr6J1iDa7vo6W+lB6oMNNmS+ts
         rIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZdAuP46YLKqTOLi0uur7CjQAOUg/pSNs3mCa7ArEgbM=;
        b=OfLfn22Pcb28EBqspwWuc94QpiXzjl2h58AsePb4DXs16OlwtZCC8hTQZZ98sG7mII
         98i4N899jqrF4yZP50c/g9iTtyuLj4qHX0X+4+HwI+G6AeJgKwuxH+3I9wII1Sb6uI+0
         jidjujj9Ke8Pb994U9I+1GYV2eTCpwuo2A7Q9yJpgE3fZIiI1BygNR1emZU+V2ZGXOZk
         h4aqkHBV+qyEOU2PnSE+LfQNcGYQhOcdYNm8dBOrdUjzxOZCheobKZB6yU7le1B9dgze
         gwlDJra+tZqlVIvgLNblazOOggQaZDqSqTxpc4eabtixOzTIA8BiQcTlgTxNNCRXacWO
         4SNA==
X-Gm-Message-State: APjAAAUzvijFbrOAggUmD2/Fy8mARMo8b/7Sa9CR0OCJyKd00bNUW6ZD
        G80W1sa1W+gI6arpZZ0niM5bNQ==
X-Google-Smtp-Source: APXvYqzeSxOgeNvjX1pS8U0XoHbz5egnZpLQ+2eXGApyjKp+Y+4Rc0LXVrdzS/X9nbox9y+fup6ksA==
X-Received: by 2002:a7b:c856:: with SMTP id c22mr1944029wml.107.1568799469020;
        Wed, 18 Sep 2019 02:37:49 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:58da:8830:e8b1:f180? ([2a01:e34:ed2f:f020:58da:8830:e8b1:f180])
        by smtp.googlemail.com with ESMTPSA id o22sm8656422wra.96.2019.09.18.02.37.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 02:37:48 -0700 (PDT)
Subject: Re: [RFC] ARM: dts: omap36xx: Enable thermal throttling
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Adam Ford <aford173@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?Q?Andr=c3=a9_Roth?= <neolynx@gmail.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Nishanth Menon <nm@ti.com>, Adam Ford <adam.ford@logicpd.com>
References: <20190912183037.18449-1-aford173@gmail.com>
 <51bb8890-bfd7-c241-1ce5-151df3a90513@linaro.org>
 <CAHCN7xKjwkJHysSkNymF=sw6KuS=FqbapuRFZODuj6E_hmRG1A@mail.gmail.com>
 <2ef812a4-2f2d-b2e2-9fa4-080775e24bc8@linaro.org>
 <20190918092418.que4c5jpcn2dcavx@vireshk-mac-ubuntu>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <caf10e4e-c688-cdb7-7d0d-7a030923a194@linaro.org>
Date:   Wed, 18 Sep 2019 11:37:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918092418.que4c5jpcn2dcavx@vireshk-mac-ubuntu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 18/09/2019 11:24, Viresh Kumar wrote:
> On 13-09-19, 00:33, Daniel Lezcano wrote:
>>
>> Hi Adam,
>>
>> On 12/09/2019 23:19, Adam Ford wrote:
>>> On Thu, Sep 12, 2019 at 4:12 PM Daniel Lezcano
>>> <daniel.lezcano@linaro.org> wrote:
>>>>
>>>> On 12/09/2019 20:30, Adam Ford wrote:
>>>>> The thermal sensor in the omap3 family isn't accurate, but it's
>>>>> better than nothing.  The various OPP's enabled for the omap3630
>>>>> support up to OPP1G, however the datasheet for the DM3730 states
>>>>> that OPP130 and OPP1G are not available above TJ of 90C.
>>>>>
>>>>> This patch configures the thermal throttling to limit the
>>>>> operating points of the omap3630 to Only OPP50 and OPP100 if
>>>>> the thermal sensor reads a value above 90C.
>>
>> Oh, that's a very interesting use case.
>>
>> AFAICT the thermal framework is not designed to deal with this
>> situation. I agree this setup may work (even if I'm not convinced about
>> the stability of the whole).
>>
>> May be Viresh can help for the cpufreq side?
> 
> Sorry but I am not able to understand what's not supported by thermal framework
> here and what can I do to help :)

The solution of preventing running above the 90°C by changing the OPPs
is fine and works. It is a way of workaround the spec.

But AFAIU, the specs of the board say the OPPs 800MHz and 1GHz are only
permitted during an amount of time above 90°C which makes the constraint
inverted and recall somehow the 'turbo-mode' description:

"
- turbo-mode: Marks the OPP to be used only for turbo modes. Turbo mode
is available on some platforms, where the device can run over its
operating frequency for a short duration of time limited by the device's
power, current and thermal limits.
"

This is where I thought you can give an input.


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

