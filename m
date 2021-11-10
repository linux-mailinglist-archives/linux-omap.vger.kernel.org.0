Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3F044BD8A
	for <lists+linux-omap@lfdr.de>; Wed, 10 Nov 2021 10:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbhKJJFr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Nov 2021 04:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbhKJJEV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 10 Nov 2021 04:04:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B196DC061764
        for <linux-omap@vger.kernel.org>; Wed, 10 Nov 2021 01:01:34 -0800 (PST)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56076D8B;
        Wed, 10 Nov 2021 10:01:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636534892;
        bh=IaNvekwKbh0piGypmEBkIxHoLqSpjnqph5Dqiqof/rk=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=STO5+CoCB+Lw8xv9P5uvTxXkkfoYqtL+9Oo7ObQCFeeJtfGhkji66I4apGDMgFKhA
         v0TTv92QdIcWN9b2ISjbVzbspm4n0enNL57/onZcd1x9JeQxkc+lPsaQy/QZ+zOo1m
         1TpBI46tC/zPBAG1jAIhAYX41abz6RclV99G7wog=
To:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <92fd80eb-6591-fb45-8885-309c79c2d4c0@gmail.com>
 <689ba705-c7fc-428c-3288-0c4adb3cc63f@gmail.com>
 <40c102c3-207b-e8ae-f292-aeff6b1515ce@ideasonboard.com>
 <7a25d8c7-7d39-f102-36ff-35cf594de9ce@gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: omapdrm VRFB rotation
Message-ID: <1cc9bb77-6a73-829e-1478-6c828f10564d@ideasonboard.com>
Date:   Wed, 10 Nov 2021 11:01:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7a25d8c7-7d39-f102-36ff-35cf594de9ce@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 10/11/2021 10:29, Ivaylo Dimitrov wrote:
> Hi,
> 
> On 9.11.21 г. 11:22 ч., Tomi Valkeinen wrote:
>> Hi,
>>
>> On 08/11/2021 19:43, Ivaylo Dimitrov wrote:
>>> Sorry, mail was sent to the old Tomi's address.
>>>
>>> On 8.11.21 г. 19:05 ч., Ivaylo Dimitrov wrote:
>>>> Hi,
>>>>
>>>> Currently omapdrm supports TILER rotation only, which excludes omap3 
>>>> and earlier SoCs. I have the hardware (N900/N950), time and will to 
>>>> implement VRFB rotation support in omapdrm driver, however, I'll 
>>>> appreciate some hints. Or, if there is already something ready, 
>>>> please point me to it so I can take it from where it is.
>>>>
>>>> Besides partially reverting 517a8a9564c0dea98e6d4e2c7f0fe4cbb9b8c9ba 
>>>> and copying VRFB code from omapfb, is there anything else I shall 
>>>> take in consideration? Or, VRFB driver should not be a part of 
>>>> omapdrm, but a standalone one?
>>
>> We already have DMM driver in the omapdrm module, and I think VRFB 
>> fits along just fine. I don't think there ever has been any other 
>> users for VRFB than DSS, and as it's such an old IP, I don't think 
>> there ever will.
>>
> 
> Ok, I guess if a need appears, it can always be moved out of omapdrm. 
> The same applies to DMM/TILER code I guess.

Yes.

>> I don't have any particular hints in mind.
>>
>> Do you have omap4/5 so you can test that DMM still works after your 
>> changes?
>>

So, first, a few clarifications about DMM/TILER. There are two somewhat 
separate things. I'm not sure what are the exactly correct words for 
these, but these are the terms I've used:

- DMM (sometimes called wrongly TILER 1D), which acts as a basic iommu. 
It doesn't do rotation, just mapping scattered pages to a contiguous 
memory view.

- TILER (or TILER 2D) which on top of the above, adds support for rotation.

> Yes, I have motorola droid4 (4430/sgx540) to test with. Which brings 
> another issue on the table - I was not able to find a way to allocate a 
> TILER dma_buf. The only way seems to be by using omap_bo_xxx functions, 
> which is a 'vendor' API. Do I miss something or omapdrm is lacks 

Yes, omap_bo_xxx is omap specific API. But I don't understand your 
question about omapdrm. omap_bo functions use omapdrm's API. The 
userspace can skip libdrm and just call the ioctls directly if they so want.

> functionality? Also, is there any particular reason why TILER is not 
> enabled by default for dma_buf BOs? Is it a limited resource (like, 
> there is a finite number of BOs that can use TILER) or there is some 

Yes, TILER is a limited resource, there's a maximum size for the 
currently mapped memory. Going through TILER is also slower, and while 
for 0 degree rotation the diff probably isn't much, it's still there.

Also TILER is not really quite supported, as I never got it working with 
all the YUV modes, and also because there's a HW issue, which may cause 
the device to lock up in some rare cases. And last, TILER creates such a 
memory layout that it's not possible to share it safely with dmabuf, as 
dmabuf lacks the features to properly describe the layout.

All that said, I think TILER should mostly work in upstream.

However, DMM is supported, and used by default. If you allocate a dumb 
buffer, it uses DMM by default.

> other reason. Also, is it possible to 'migrate' non-TILER BO to a TILER 
> one? The same issue will arise with VRFB (with its 12 contexts on omap3) 
> as well.

No, not possible to migrate.

> So, in short:
> - omap3: VRFB driver to be added to omapdrm.
> - omap3/omap4/omap5: dma_buf lacks TILER/VRFB support

Can you elaborate on what's missing?

> Adding VRFB should be trivial, but I am more concerned about how to 
> rotate dma_buf buffers. I imagine something like - on setting the plane 
> "rotate" property, migrate physical address from 'normal' CMA memory to 
> a TILER/VRFB one. Is that possible? What if we already have that bo 
> mmap-ed? What if SGX MMU is already set up to access the memory? Or, is 
> it possible to use TILER for read access, the same way VRFB can be 
> set-up, so instead of writing through TILER/VRFB, DSS to be set-up to 
> read FB memory through TILER/VRFB thus avoiding the need to migrate SG 
> and/or page tables?

I have to say I don't quite remember how VRFB works. But for TILER, we 
have to specifically allocate a TILER buffer. And then everyone else 
uses TILER 0 degree view, but DSS can use 0/90/180/270 view when showing 
it on the display.

But I think the case is the same for VRFB too: if you want to use VRFB, 
all access has to go through VRFB, as the pixels are written to memory 
in a special way.

  Tomi
