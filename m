Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39242452EE7
	for <lists+linux-omap@lfdr.de>; Tue, 16 Nov 2021 11:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233943AbhKPKYO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Nov 2021 05:24:14 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34176 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234063AbhKPKYB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Nov 2021 05:24:01 -0500
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7AE7093;
        Tue, 16 Nov 2021 11:20:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637058059;
        bh=1nzaI20yM3IKYV7HmH0kuvQFx8ENW0Z2DLDO3V1OFEA=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=eqCXS8kFrwY2GNilEpLgZaqTuZrndJfh5xq1xQg7gXCzeEq8GyqwWlQq1k6Ay2GPS
         WjkFvl6ky+9gUgFm2ey0YaVIuSDWg6uoCAGNlU3TXAM1XQjbjEI4JF5z+2eTIcHsBj
         a0isXRt1MulOR/ieIC9LBFxqIngg/QL4vdRL0GTg=
To:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc:     matthijsvanduin@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1636796417-5997-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1636797239-6384-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <36598203-eced-131d-85ef-f4940872e751@ideasonboard.com>
 <16a38e8e-071c-7275-8a33-487f7c3c8f2a@gmail.com>
 <ee42102b-c584-6e20-e710-711f79467fa3@ideasonboard.com>
 <e24ba773-298c-c703-9719-abba3527f8dd@gmail.com>
 <16724dbf-ff40-4d18-cde4-b3716583289f@ideasonboard.com>
 <52829986-ee80-6965-beb3-411f3728e2aa@gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2] drm: omapdrm: Export correct scatterlist for TILER
 backed BOs
Message-ID: <3b484902-2741-0333-389f-e5c31f278c87@ideasonboard.com>
Date:   Tue, 16 Nov 2021 12:20:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <52829986-ee80-6965-beb3-411f3728e2aa@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 16/11/2021 10:27, Ivaylo Dimitrov wrote:
> Hi,
> 
> On 16.11.21 г. 8:42 ч., Tomi Valkeinen wrote:
>> On 15/11/2021 19:15, Ivaylo Dimitrov wrote:
>>> Hi,
>>>
>>> On 15.11.21 г. 17:37 ч., Tomi Valkeinen wrote:
>>>> On 15/11/2021 15:55, Ivaylo Dimitrov wrote:
>>>>> Hi Tomi,
>>>>>
>>>>> On 15.11.21 г. 10:42 ч., Tomi Valkeinen wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 13/11/2021 11:53, Ivaylo Dimitrov wrote:
>>>>>>> Memory of BOs backed by TILER is not contiguous, but 
>>>>>>> omap_gem_map_dma_buf()
>>>>>>> exports it like it is. This leads to (possibly) invalid memory 
>>>>>>> accesses if
>>>>>>> another device imports such a BO.
>>>>>>
>>>>>> This is one reason why TILER hasn't been officially supported. But 
>>>>>> the above is not exactly right, or at least not the whole truth.
>>>>>>
>>>>>
>>>>> Definitely, not only these BOs lie about their memory layout, they 
>>>>> lie about size and alignment as well. I have 2 more patches here 
>>>>> (one is to align TILER memory on page, as proposed by Matthijs in 
>>>>> the other mail, the other to set the correct size when exporting 
>>>>> TILER BO), but I wanted to hear from you first, like, what is the 
>>>>> general trend :) .
>>>>
>>>> My thoughts here are that the current code doesn't work in practice, 
>>>> so if you get it fixed, it's great =).
>>>>
>>>>> Also, I have another patch in mind, that will enable exporting of 
>>>>> buffers that are not TILER backed, but are not CMA backed either. 
>>>>> SGX for example does not need CMA memory to render to.
>>>>
>>>> What do you mean with this? DSS needs contiguous memory, so the 
>>>> memory has to be 1) physically contiguous, 2) mapped with DMM or 3) 
>>>> mapped with TILER. There's no reason for the driver to export 
>>>> non-contiguous memory.
>>>>
>>>
>>> DSS yes, but, omapdrm is used to allocate non-scanout buffers as 
>>> well, which do not need to be (and in practice are not) contiguous. 
>>> GPU (or anyone with MMU) can render on them (DRI buffers for example) 
>>> and later on those buffers can be copied (blit) to the framebuffer. 
>>> Yes, not zero-copy, but if you're doing compositing, there is no 
>>> option anyway.
>>>
>>> Exactly this is done by omap-video driver for example. GBM BOs are 
>>> allocated through omapdrm as well.
>>
>> That is not correct and shouldn't be done. omapdrm is not a generic 
>> memory allocator. We have real generic allocators, so those should be 
>> used. Or, if the buffer is only used for a single device, the buffer 
>> should be allocated from that device's driver.
>>
> 
> Yes, I saw the comment in kernel headers that dumb buffers should not be 
> used for rendering 
> (https://elixir.bootlin.com/linux/latest/source/include/drm/drm_drv.h#L361). 
> This makes no sense to me at all, but maybe I am missing the point.

I believe that comments refers to another issue: a dumb buffer from may 
not be usable for rendering. It's only guaranteed to be 
readable/writable by the CPU.

What I'm talking about is that a driver must support memory allocations 
for buffers that the device handled by the driver can use. In many cases 
that allocated buffer also works with other devices, and thus dmabuf 
export/import can be used. But a driver supporting memory allocations 
for buffers that the device itself cannot use is just wrong.

> Also, it could be that the implementation of omap-video and/or PVR 
> userspace blobs is against the specs, but I see omap-video calling 
> DRM_IOCTL_OMAP_GEM_NEW for DRI buffers without OMAP_BO_SCANOUT and 
> libdbm.so calling DRM_IOCTL_MODE_CREATE_DUMB to create buffers then used 
> for rendering.

I think neither of those are exactly material to be used as examples on 
how to do things. And there's lots of history there. We didn't have 
generic allocators back then.

> This is not an issue on omap4 an later, because when export of that 
> buffer is requested, omapdrm uses DMM and exports a single scatterlist 
> entry, IIUC.
> 
> But, on omap3, given there is no DMM, export is simply refused. I don't 
> see that as a consistent behaviour - we shall either a) export 
> non-scanout buffers (scattered ones) using whatever is supported (DMM 
> and single scatterlist entry on omap4 (and later), multiple-entry 
> scatterlist on omap3) or b) always require OMAP_BO_SCANOUT for BOs to be 
> exported and refuse to export if no such flag is set. I would say b) is 
> not a good option which leaves a) only.

I think we should always require OMAP_BO_SCANOUT, or rather, drop the 
flag totally and always expect the buffer to be a scanout buffer. The 
only use for DSS is scanout, and those are the only buffers that omapdrm 
needs to support. But that would be breaking the uAPI, so I think we 
just have to support what we do now.

> BTW, I think DMM is not really needed unless userspace requests mmap(), 
> in theory we can provide userspace with view through DMM but give device 
> drivers multiple entry scatterlist, potentially saving DMM space.

The userspace (CPU) doesn't need the DMM, the CPU has an MMU. I thought 
we already skip the DMM when mapping to the userspace. But in TILER case 
we always need TILER, even with the CPU.

> I hope I made it clearer now why I think this feature shall be implemented.

I think it's just adding more wrong on top of the old wrong =).

Also, if we need DMM/TILER allocations for other devices than DSS (but 
so far this hasn't been mentioned), then I think the DMM/TILER 
functionality should be separated from omapdrm and moved to (I think) 
dma-heap.

>>>>> 2. Set exp_info.size = omap_gem_mmap_size(obj); when exporting a 
>>>>> BO. That way importer knows the real BO memory size (including 
>>>>> alignment etc) so he will be able to calculate the number of pages 
>>>>> he needs to map the scatterlist.
>>>>
>>>> Can you elaborate what this means?
>>>>
>>>
>>> When we align to page, we shall report the size including the 
>>> alignment, no? Or, it is the importer that shall take care to 
>>> calculate BO size( including the alignment) based on scatterlist if 
>>> he needs to?
>>
>> I'm not sure... But I guess the export size should include the alignment.
>>
> 
> My understanding as well. Will sent that change as a part of page 
> alignment patch.
> 
>> Hmm... I haven't had enough coffee yet, but how does this go... Let's 
>> say we have a tiled fb, and the width gets expanded to a page. What 
>> happens to reads/writes that happen outside the fb, but still within 
>> the page? Those should cause an error or do nothing, but is it 
>> possible that they go through TILER and get mapped to some real memory 
>> location?
>>
> 
> I lack the details here, but reading through TRM leaves me with the 
> impression that TILER smallest unit is a tile, and every tile is backed 
> by a real memory page (4KiB), so outside read-writes will end up in 
> memory that's there but unused and will do nothing.
> 
> omap_gem_new() calls tiler_align(), which in turn seems to return 
> page-aligned size, so I think there is no issue here.

Maybe, but, consider this example, with numbers totally out of thin air: 
We have a fb with the width of 32 pixels, so 128 bytes. If we have tiles 
which cover 32 x 32 pixels (so 4096 bytes with 4 bpp), we need one tile 
to cover the width. But we have all the rest of the page mapped, so 3968 
bytes that are not covered with a tile (or rather, we haven't configured 
that tile, or maybe the tile contains old configuration).

I could be totally wrong here, as I don't remember the details. But I do 
think that it's very easy to get this wrong, creating memory corruptions 
and/or security violations.

  Tomi
