Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC5B6454819
	for <lists+linux-omap@lfdr.de>; Wed, 17 Nov 2021 15:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236613AbhKQOHH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Nov 2021 09:07:07 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50628 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234454AbhKQOHG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 Nov 2021 09:07:06 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 238061F460FE
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637157842; bh=RpD5S9Asz3OtAjBXVR4+vHN+oQ3Yq19pMB8YctTiXik=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=fggto94AosZv9Ftfg9deTux6tjPP6ZpqkR9rKBINA2Wz15AdWLhP/EjiwFCKa+EBw
         DbhdzmbpPVgo0WxVxG4C/gCxx7kDqcPMmJHvkMm4FFW6tLIS64w+K+jctJC/MVdP+K
         3T7RCexh5qxcxOtXX1Y+bicEOJHJDoJDufhGKdr5aYaAkBF0FsCy2zkPD2arbeANwS
         Q2kt1zCrG57YWzmF+znO9xYACsBPnaD2imVn4dCyP5VImHe8emi9npjaOtu6I0+m8M
         N5jV6iNPWe7nC2TRze74edBaSA8n7Uff1PAEILO/NuT3K0X3BUkOB/3/jpLCG4kCFR
         wuDrcCbyIjnGQ==
Subject: Re: [PATCH v3 7/7] ARM: implement support for vmap'ed stacks
To:     Ard Biesheuvel <ardb@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Kees Cook <keescook@chromium.org>,
        Keith Packard <keithpac@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "kernelci@groups.io" <kernelci@groups.io>
References: <CAMj1kXHLushGdSfH3HEUeRuGuZMFS1PUZ+_7vp5dmRHGtjyYfQ@mail.gmail.com>
 <YZQPTmfjMq5IQeSR@shell.armlinux.org.uk>
 <CAMj1kXGZmTJiEUqgXn7ibi+UftjYRwMRFzfKUo=XDFKitn-Agg@mail.gmail.com>
 <YZS2eC0lmR+bonvc@atomide.com>
 <CAMj1kXFbpAgHk4Fe03_NfP6kL0zJhTWOYWBdQvfzfabu6XY1Sg@mail.gmail.com>
 <YZS+/Axb7u7FsvbK@atomide.com>
 <CAK8P3a02uZdu1Q8a9vw5+9u1s=MWm7Z-bGm51YtZveqoQJ0BZg@mail.gmail.com>
 <CAK8P3a0mV7=mPSLe=9mOMfK3RvuPJ9z8=9CS75=7pG=A2ngZQg@mail.gmail.com>
 <CAMj1kXE_aVGN_T4MXkbECjh0ERFD7nZ6goL5mcg_ki46nqKcGQ@mail.gmail.com>
 <CAMj1kXHRBCmNXVPjhe7KOGnf7j2-uOm94XjkSSQ844H6_QROFw@mail.gmail.com>
 <YZTjtY463f2HQwL6@atomide.com>
 <CAMj1kXGfmwjqJCbnW0n6jDteA7DS+8Nt33pc_gBg5gs3H3uX5A@mail.gmail.com>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <d1648519-8371-51f5-8557-2dcfbd76ca7f@collabora.com>
Date:   Wed, 17 Nov 2021 14:03:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXGfmwjqJCbnW0n6jDteA7DS+8Nt33pc_gBg5gs3H3uX5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 17/11/2021 11:13, Ard Biesheuvel wrote:
> On Wed, 17 Nov 2021 at 12:12, Tony Lindgren <tony@atomide.com> wrote:
>>
>> * Ard Biesheuvel <ardb@kernel.org> [211117 10:49]:
>>> On Wed, 17 Nov 2021 at 10:08, Ard Biesheuvel <ardb@kernel.org> wrote:
>>>>
>>>> On Wed, 17 Nov 2021 at 10:07, Arnd Bergmann <arnd@arndb.de> wrote:
>>>>>
>>>>> On Wed, Nov 17, 2021 at 10:03 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>>>>>
>>>>>> On Wed, Nov 17, 2021 at 9:36 AM Tony Lindgren <tony@atomide.com> wrote:
>>>>>>> * Ard Biesheuvel <ardb@kernel.org> [211117 08:29]:
>>>>>>>>
>>>>>>>> Thanks Tony, that is very helpful. I have a Beaglebone white somewhere
>>>>>>>> so I'll try and reproduce it locally as well.
>>>>>>>
>>>>>>> I think with Beaglebone you may hit this only with suspend/resume if at
>>>>>>> all. On am335x cpuidle is not shutting down the CPU. And only some models
>>>>>>> will suspend to deeper idle states as it depends on the PMIC.
>>>>>>>
>>>>>>> If you have some test patch to try, just let me know.
>>>>>>
>>>>>> I looked at how the sleep code is called and found that cpu_suspend()/
>>>>>> __cpu_suspend() has interesting manipulation of the stack pointer to
>>>>>> call the platform specific function with a simple 1:1 page table,
>>>>>> I would expect the problem somewhere in there, haven't pinpointed
>>>>>> the exact line yet, but if any of that code tries to local the physical
>>>>>> address of the stack using virt_to_phys or its asm equivalent, this
>>>>>> fails for a vmap stack.
>>>>>
>>>>> and just after sending this I see
>>>>>
>>>>> void __cpu_suspend_save(u32 *ptr, u32 ptrsz, u32 sp, u32 *save_ptr)
>>>>> {
>>>>>         *save_ptr = virt_to_phys(ptr);
>>>>>
>>>>> 'ptr' is a pointer to the stack here. It might not be the only place that
>>>>> needs fixing, but this clearly has to do a page table walk like
>>>>> vmalloc_to_page() does to get to the correct physical address.
>>>>>
>>>>
>>>> I had just arrived at the same conclusion. I'll fix this up and drop
>>>> it in kernelci.
>>>
>>> Updated branch here:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?h=arm-vmap-stacks-v4
>>
>> Great that branch boots for me!
>>
> 
> Thanks for testing!

Tested-by: "kernelci.org bot" <bot@kernelci.org>

https://staging.kernelci.org/test/plan/id/6194fd2f85155923f71760ce/

Guillaume
