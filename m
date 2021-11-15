Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD081450298
	for <lists+linux-omap@lfdr.de>; Mon, 15 Nov 2021 11:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhKOKkp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Nov 2021 05:40:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbhKOKkn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 Nov 2021 05:40:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB04DC061746;
        Mon, 15 Nov 2021 02:37:44 -0800 (PST)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 556F99CA;
        Mon, 15 Nov 2021 11:37:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636972662;
        bh=F2gYKrQqm32kWBBExEbcUA2GB9lkJ7ihQQ1PePg3EX4=;
        h=To:References:From:Cc:Subject:Date:In-Reply-To:From;
        b=N4bdutcwNloWF3chLf6bSb8Ft2XrlQGwQdmAx30ZFcfP22WjWZdxV1taKwkzHCRue
         Ygnx5hBmQoJWwS+8uAWLBHPIt/XUfNNNI7SUw7ZDL5u4wf/jGPtNlgUrugmT7QXjQJ
         PZ3zUgcL9WZIIURvksL215mn1cCzHRqc2ODRxVpU=
To:     Matthijs van Duin <matthijsvanduin@gmail.com>
References: <1636796417-5997-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1636797239-6384-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <36598203-eced-131d-85ef-f4940872e751@ideasonboard.com>
 <YZIm/GiRWv0nPN5b@chinchilla>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: Re: [PATCH v2] drm: omapdrm: Export correct scatterlist for TILER
 backed BOs
Message-ID: <e39cc7c8-6504-f5ae-5693-7eb5b5d00cd1@ideasonboard.com>
Date:   Mon, 15 Nov 2021 12:37:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZIm/GiRWv0nPN5b@chinchilla>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 15/11/2021 11:23, Matthijs van Duin wrote:
> On Mon, Nov 15, 2021 at 10:42:41AM +0200, Tomi Valkeinen wrote:
>> A BO's memory via the TILER memory is
>> contiguous, although with consistent gaps of
>> memory that should not be accessed.
> 
> But pretending that these "gaps" are part of the buffer is a security
> vulnerability, since that memory which "should not be accessed" may
> belong to different security contexts, and exporting the entire
> contiguous region covering the buffer allows untrusted contexts (e.g.
> userspace) to access this memory.

Yes, I fully agree. I wasn't criticizing the patch, just wanted to 
highlight the unmentioned aspects.

>> IPs that might use TILER
>> backed BOs only support contiguous memory.
>>
>> This means that the drivers for such IPs cannot
>> use the BOs exported like you do in this patch.
>> I believe the drivers could be improved by
>> writing a helper function which studies the
>> sg_table and concludes that it's actually
>> contiguous.
> 
> That indeed sounds like the proper solution for such importers, rather
> than making the exporter lie about the buffer bounds to work around
> limitations of these importers.

The annoying thing with this solution is that we need to add extra code 
to all the drivers that want to import TILER buffers, even if the 
drivers shouldn't know anything about TILER.

Then again, the code is not really TILER or OMAP specific, and any IP on 
any platform that only supports contiguous buffers, but supports stride, 
could import such buffers. Which hints that maybe the code should be 
somewhere in the framework, not in the driver. In practice it may be 
better to just swallow the annoyance, add the code to the drivers and be 
done with it =).

>> Did you look at the userspace mmap of TILER
>> buffers? I wonder if that goes correctly or not.
>> Isn't memory to userspace mapped per page, and
>> lengths of the TILER lines are not page aligned?
> 
> Mapping to userspace uses an ugly hack whereby small slabs of the
> buffer (4096x64 (8bpp), 2048x32 (16bpp), or 1024x32 (32bpp) pixels) are
> dynamically mapped to dedicated page-aligned regions of the TILER
> virtual space.  For each of the three bitdepths only two such slabs can
> be mapped into userspace at any given time (on the entire system), so
> using this mechanism to render graphics from userspace can easily cause
> hundreds if not thousands of page faults per second.

Ah, right, yes, now I remember. The userspace mmap of TILER buffers 
isn't very usable.

> The alternative (used e.g. in the pyra kernel) is to force all TILER
> buffers to be page-aligned, at the cost of wasting some TILER space.
> This will presumably also be necessary to allow SGX to import these
> buffers since its MMU can obviously also not map data which is not
> page-aligned, same for any other importer which uses an MMU to enforce
> memory security (rather than being trusted to simply refrain from
> accessing data outside the declared bounds).
> 
> Ideally such page-alignment should only be applied to buffers which are
> intended to be consumed by importers which require this, though it's not
> clear how that might be accomplished.

Do you mean that each TILER _line_ should be page aligned and the length 
should be page divisible? Doesn't that cause quite a lot of wasted 
space? Although that, of course, depends on the use. If the primary use 
case is allocating a few full screen display buffers, perhaps the waste 
is negligible.

In any case, I'm fine with that change, too, as it helps making TILER 
usable.

And while speaking about usable, if I recall right, the 
omap_bo_new_tiled() is pretty annoying to use. You need to give the 
width and OMAP_BO_TILED_x flag as a parameter, and if I recall right, 
it's all but obvious how those need to be set for, e.g. NV12. But it 
works so perhaps better to keep it as it is...

There was also some particular YUV format with some rotations that I 
never got working, even after discussing with TI DSS HW guys.

  Tomi
