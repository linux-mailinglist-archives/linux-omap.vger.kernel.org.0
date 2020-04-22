Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8741B4CFE
	for <lists+linux-omap@lfdr.de>; Wed, 22 Apr 2020 21:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgDVTEy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Apr 2020 15:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgDVTEy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Apr 2020 15:04:54 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DC3C03C1A9;
        Wed, 22 Apr 2020 12:04:54 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t14so3789815wrw.12;
        Wed, 22 Apr 2020 12:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oQOi1s9dbkABaVi7QdtwrfqPXvQECiVynxnnFPowb4o=;
        b=koyCubwAqgZ2hQT4GJFYFT4R3wo6H0N+a5EpwCfrGnb5w4o44x6kO4Ln4kxafMlKwj
         k8w7tzo6j3/AV6AINVCUQokIC8LogDZZsORENlLR9JUrFUN9wY2X3bXscJVY/LLF5N7d
         HZVVG5P7GndAkgsUOuwqtyffOBT9ryZ77wyCfJrf0gNh6BJ1q/TGyLTet8yNBYvhtWDn
         yXMzy+MxhNlEzdmYcwYpOA6THXVwsUXEvyjH3Sj98LpTYL/eEWIazY7fKt+UpDgcSRqd
         gTKnyhbjtxP35UYxEuNmbcBZhYolcBqS3ONw9I720hBcAAS2HN/2PVKQGDrRwSLO2BNn
         q0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oQOi1s9dbkABaVi7QdtwrfqPXvQECiVynxnnFPowb4o=;
        b=BQqNgGuYDoTezaB6doldzylRE/yN0Q3pN9DfHNzt8Om7+ZY+qw51oYk0ee6y6iD5aq
         +Hh722lIPWNR58+IqgxwxXfIr94RrCfWiRFfTRXXORinEXy3okcHfUN9YlScAr4L+fnI
         bwMWRMnhjaKLSTwgjAhBv2iaBdvViYYTZHAWaWJXmGVC6h2TnIPufPMATpgRzcI3mZLX
         V5pkJqjDWBg9qdNsTUqozb44BzilxnpKJ+fVqwGnohLs7HZAQwCXlH0QJg10Wtq6myeG
         GC5tCoKBaclmnrqUceX9Yu/4VY04vqxlxgQZU3XHhE8UbhMnBaXBn3DorrkV3TuDRuzz
         qimw==
X-Gm-Message-State: AGi0PuYd9fUWrx5XPHoiHlHX8X+DwRGv+9a/1WTFEB+s2t9VVQIZ0QpN
        jKFWvWz0n3f2DJbQ48tW9jJgnL8O
X-Google-Smtp-Source: APiQypLGhRSRJO8phdlyrrlKkbI8U+pzRf1zMNy2uQBOqHsGXooEBQ1P3tHzxlte/9NxHaXWCqo51Q==
X-Received: by 2002:a5d:4ed1:: with SMTP id s17mr546353wrv.310.1587582292472;
        Wed, 22 Apr 2020 12:04:52 -0700 (PDT)
Received: from ?IPv6:2a02:810d:340:2e50:404f:414c:5344:4db8? ([2a02:810d:340:2e50:404f:414c:5344:4db8])
        by smtp.gmail.com with ESMTPSA id d7sm126297wrn.78.2020.04.22.12.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 12:04:51 -0700 (PDT)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Paul Cercueil <paul@crapouillou.net>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Tony Lindgren <tony@atomide.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200415130233.rgn7xrtwqicptke2@gilmour.lan>
 <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com>
 <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com>
 <20200420073842.nx4xb3zqvu23arkc@gilmour.lan>
 <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com>
 <20200421112129.zjmkmzo3aftksgka@gilmour.lan>
 <20200421141543.GU37466@atomide.com>
 <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com>
 <20200422065859.quy6ane5v7vsy5tf@gilmour.lan>
 <1AA57A0C-48E6-49BB-BB9A-2AAFFB371BCD@goldelico.com>
 <20200422151328.2oyqz7gqkbunmd6o@gilmour.lan>
 <07923B6C-4CCD-4B81-A98F-E19C43412A89@goldelico.com>
 <MC879Q.XY9S0U9R35681@crapouillou.net>
 <D90A610B-1F26-4AD4-843A-60EB4E410377@goldelico.com>
From:   Philipp Rossak <embed3d@gmail.com>
Message-ID: <a1fd55a3-23dd-aa0c-35dd-6956ff4baa1c@gmail.com>
Date:   Wed, 22 Apr 2020 21:00:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <D90A610B-1F26-4AD4-843A-60EB4E410377@goldelico.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Hi,

On 22.04.20 19:23, H. Nikolaus Schaller wrote:
> Hi Paul,
> 
>> Am 22.04.2020 um 18:55 schrieb Paul Cercueil <paul@crapouillou.net>:
>>
>> Hi Nikolaus,
>>
>>
>> Le mer. 22 avril 2020 à 18:09, H. Nikolaus Schaller <hns@goldelico.com> a écrit :
>>> Hi Maxime,
>>>> Am 22.04.2020 um 17:13 schrieb Maxime Ripard <maxime@cerno.tech>:
>>>> On Wed, Apr 22, 2020 at 09:10:57AM +0200, H. Nikolaus Schaller wrote:
>>>>>> Am 22.04.2020 um 08:58 schrieb Maxime Ripard <maxime@cerno.tech>:
>>>>>>> It also allows to handle different number of clocks (A31 seems to
>>>>>>> need 4, Samsung, A83 and JZ4780 one) without changing the sgx bindings
>>>>>>> or making big lists of conditionals. This variance would be handled
>>>>>>> outside the sgx core bindings and driver.
>>>>>> I disagree. Every other GPU binding and driver is handling that just fine, and
>>>>>> the SGX is not special in any case here.
>>>>> Can you please better explain this? With example or a description
>>>>> or a proposal?
>>>> I can't, I don't have any knowledge about this GPU.
>>> Hm. Now I am fully puzzled.
>>> You have no knowledge about this GPU but disagree with our proposal?
>>> Is it just gut feeling?
>>> Anyways, we need to find a solution. Together.
>>>>> I simply do not have your experience with "every other GPU" as you have.
>>>>> And I admit that I can't read from your statement what we should do
>>>>> to bring this topic forward.
>>>>> So please make a proposal how it should be in your view.
>>>> If you need some inspiration, I guess you could look at the mali and vivante
>>>> bindings once you have an idea of what the GPU needs across the SoCs it's
>>>> integrated in.
>>> Well, I do not need inspiration, we need to come to an agreement about
>>> img,pvrsgx.yaml and we need some maintainer to finally pick it up.
>>> I wonder how we can come to this stage.
>>> If I look at vivante,gc.yaml or arm,mali-utgard.yaml I don't
>>> see big differences to what we propose and those I see seem to come
>>> from technical differences between sgx, vivante, mali etc. So there
>>> is no single scheme that fits all different gpu types.
>>> One thing we can learn is that "core" seems to be a de facto standard
>>> for the core clock-name. An alternative "gpu" is used by nvidia,gk20a.txt.
>>
>> The Vivante GPU binding requires "bus", "core" and "shader" clocks. But if your SoC only has one clock for the GPU, there's nothing that prevents you from passing the very same clock as "bus", "core" and "shader". This is what we do on the Ingenic JZ4770 SoC.
> 
> Fine and good to know.
> 
> Well, for the SGX we so far only know a single "core" clock (with different
> names). Only the A31 seems to be different.
> 
> Fortunately I finally found a little time to scan through the a31
> user manual: http://dl.linux-sunxi.org/A31/A31%20User%20Manual%20V1.20.pdf
> 
> There are 3 clock dividers. And there is a single clock PLL8 dedicated to
> the gpu. The clock dividers are called "gpu core", "gpu mem", "gpu hyd".
> 
> Then, there are dedicated clock gating registers. And idle/power status
> registers.
> 
> Unfortunately, chapter "5.1. GPU" is almost empty and has no block diagram.
> So I have no idea what "HYD" stands for. And if the memory and HYD clocks
> are needed and how they should be initialized. If they are different ones
> or can all be driven by PLL8 in parallel.
> 
> That scarce information makes it difficult to form a "proper" bindings
> document out of it. Any can fit or be false.
> 
> At least there is something common with all other SGX implementations I
> am aware of: there is a "core" clock.
> 
> So I'd suggest to get things moving forwards:
> * we add a "core" clock-names to the bindings
> * this can't be wrong for the A31 since it is defined in the data sheet
> * we make it optional since the omap chips have a clock wrapper
> * "core" is a name I think all architectures/drivers can live with
>    and can add later "shader", "bus" etc. if needed
> * any additions for the A31 will be additions
> 
> If that sounds ok and nobody objects to it, I can submit a new patch
> version for further review.
> 
> BR and thanks,
> Nikolaus
> 
A few years back, I did a big research on the PowerVR GPUs. Back then I 
found an interesting TI datasheet. I forgot about this till I have seen 
the right buzz words. Sorry that I remembered it that late.

Back then I came to the conclusion that all PowerVR GPU's have in 
general 3 Clocks.

A system clock, a memory clock and a core clock. [1].

The hyd_clk at sunxi devices seems to be the system clock.

With those additional information it should be very easy to get a proper 
binding.

Cheers
Philipp

[1]: 
https://github.com/embed-3d/PVRSGX_hwdoc/blob/master/sources/pdfs/Spruh73c_chapter_SGX_Graphics_Accelerator.pdf
