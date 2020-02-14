Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3B5215D1CA
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 06:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgBNFwB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 00:52:01 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:36925 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgBNFwB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 14 Feb 2020 00:52:01 -0500
Received: by mail-ed1-f67.google.com with SMTP id df17so3084699edb.4
        for <linux-omap@vger.kernel.org>; Thu, 13 Feb 2020 21:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AHj/3a6rTMxmSLpK3KAmIbVHYNA5ekPuhCG9apQLT9I=;
        b=kh08UuhXMk9TIapAKEMp5D/RDStm6IWpnZ+YkYoys8syC4E9bma367M3L4lZGRkR9B
         DUoiSCg4A5AwyWzQq9L23kdx+tf05jEWVll4Z7pMtY+UgvEzjIBmjMbqChOxenGAftba
         dQSiOVToXo5pWV5dcQtBMx+ZrJrwYwV/ULiTjGIrwRx+hwXSXJy4nO1i25jrR0UJ/wBf
         fKfkZlGsl1Ewu8fpvv/VyTcmJ6FX8g3xOJ55o3On7j9W8A/9granKvluagpHUj0Ga6+s
         C3sLDv0Gr/FhRYjBGps/D0q6DUqnD4CF2FV/KKymER0RWMh9kAv1oQ1YX/0tvtuD63Qj
         MjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AHj/3a6rTMxmSLpK3KAmIbVHYNA5ekPuhCG9apQLT9I=;
        b=KMZN+FLEPKEwygcJG7STp6YY5EPTIoHYZuoWuiNbKrWMzCQdVyKIoPqxOYDxVztBso
         C+CzvFl37e/rZ5GhHG2fPcl5N9f4r36WqPnIJnuFiFN9cOatlnDvmwmDp81+0n9UhiCE
         jIc9BAvshSU2ozArvsLW82Hx5YgE5MqRz7G45l0A3zllIVQMRE5AWw9eJV0M7rzxXWt2
         +Kf1zq1YXeZ7HolKLZsBMSUnhFIeHCipSLDbC282zn9DobdEQQ4V1DFhCcskO1T373sW
         n8dfKuamKRkDasWwmhqErImPhyANtwFdKJB5zGaF+W3SErvyjvvRS7JX3QKDmVODLZIa
         JceQ==
X-Gm-Message-State: APjAAAXQYPU0pqruxPX8XTSSDCFRddoF74Gq+Q/73l5FVbEIlfJXuUGQ
        0AQ1cD5DDkUrUotx8Svzf80=
X-Google-Smtp-Source: APXvYqzTKTS5IwudF3BS2yNwDADccwogAwYw41C5BWttmfw5yVxbmQ+CKEiXFeEpOSnU7/2enr/85A==
X-Received: by 2002:a50:d883:: with SMTP id p3mr1126854edj.58.1581659520129;
        Thu, 13 Feb 2020 21:52:00 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id v16sm479068ejx.5.2020.02.13.21.51.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Feb 2020 21:51:59 -0800 (PST)
Subject: Re: N900: Remove mmc1 "safety feature"?
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Pavel Machek <pavel@ucw.cz>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "Arthur D." <spinal.by@gmail.com>
References: <5362c659-120f-5247-aaa5-7916229300bc@wizzup.org>
 <20200208190448.GA12984@amd>
 <270f27c9-afd6-171d-7dce-fe1d71dd8f9a@wizzup.org>
 <1eac0db3-17ce-8ebd-4997-8b1c282126e4@wizzup.org>
 <20200208220621.GA18161@amd>
 <d2d6d6ac-c964-ac48-1616-6f1826219385@wizzup.org>
 <20200210192714.GC14939@darkstar.musicnaut.iki.fi>
 <8d0ecfcd-f9a7-9563-8a39-9793cfbeb893@wizzup.org>
 <20200214013924.7wcama5ix2ivok2e@earth.universe>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <8774c76c-e5df-6126-657e-3ac55f241951@gmail.com>
Date:   Fri, 14 Feb 2020 07:51:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200214013924.7wcama5ix2ivok2e@earth.universe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 14.02.20 г. 3:39 ч., Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Feb 12, 2020 at 02:02:53PM +0100, Merlijn Wajer wrote:
>> On 10/02/2020 20:27, Aaro Koskinen wrote:
>>>> So how does this currently happen, the unmounting? Does the mmc1 card
>>>> just disappear from /dev/ without any safe unmount? I don't understand
>>>> how the current setup can work from a userspace point of view.
>>>>
>>>> Userspace could react on kernel events that tell it the cover is open,
>>>> but I assume the kernel doesn't just decide to nuke the node from /dev/,
>>>> so in that case the current DTS setup still doesn't make sense, right?
>>>>
>>>> What am I missing? Could you describe how this would work in a 'real
>>>> life' scenario?
>>>
>>> I don't think it can work with the current mainline kernel.
>>>
>>> I recall the original Nokia kernel used the GPIO for "cover switch"
>>> instead of card detect, and it was visible in sysfs, and this allowed
>>> userspace to react on cover removal.. In the mainline kernel we have
>>> this for older Nokia devices (770, N8x0), but not for N900. Still it
>>> wouldn't help much for "safe unmount" as the unmount can take quite a
>>> while, and user may remove the card too early.
>>
>> Shall I send in a patch removing this check from the device tree, then?
> 
> I agree it's mostly annoying and suggest to convert the GPIO
> into a gpio-key using a newly defined
> 
> SW_MACHINE_COVER /* set = cover closed */
> 
> Similar to the camera lens cover. It means userspace has a chance to
> show a warning, but system works generally. I think it's ok to
> assume that people running mainline on their N900 nowadays know what
> could happen when they hot-remove SD cards.
> 

That sounds way better to me than just removing the check.

Regards,
Ivo
