Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3D137123E
	for <lists+linux-omap@lfdr.de>; Mon,  3 May 2021 10:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbhECIFi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 May 2021 04:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhECIFh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 3 May 2021 04:05:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101ECC06174A
        for <linux-omap@vger.kernel.org>; Mon,  3 May 2021 01:04:45 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9395787C;
        Mon,  3 May 2021 10:04:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620029082;
        bh=R45kvhhElaydLXIbk2IabGmmhuGtD4NOgjre485yj0g=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=W7l6SmcJgJuPuqo/kXZJdYOZCSKTnOjDexFYYOMCtXvQp7yiz50NbXCZB+Udc0A4V
         jG3v/FfJ/0YFAsAqNgzpe4Dm0RCMuKcxZjDDqXhEgKSc6ukRsf9tuXFOZ7yl2PFsmC
         Kngp6E/+MkAQYXw13M/8uHHWtStfyORPc9NAIzZk=
To:     Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
References: <20210428092500.23521-1-tony@atomide.com>
 <YIlsy4mOkLcbMKwr@pendragon.ideasonboard.com> <YIo6CzsU4JRvAdpb@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCHv2] drm/omap: Fix issue with clocks left on after resume
Message-ID: <79bea9b8-b2d2-11ec-87a3-34626347e122@ideasonboard.com>
Date:   Mon, 3 May 2021 11:04:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YIo6CzsU4JRvAdpb@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 29/04/2021 07:46, Tony Lindgren wrote:
> Hi,
> 
> * Laurent Pinchart <laurent.pinchart@ideasonboard.com> [210428 14:10]:
>> Based on my experience on the camera and display side with devices that
>> are made of multiple components, suspend and resume are best handled in
>> a controlled way by the top-level driver. Otherwise you end up having
>> different components suspending and resuming in random orders, and
>> that's a recipe for failure.
> 
> Manually suspending and resuming the components should be doable based
> on the registered components. However, I'm not sure it buys much in
> this case since we do have Linux driver module take care of things for
> us for most part :)
> 
> The dss hardware is really a private interconnect with a control module,
> and a collection of various mostly independent display output device
> modules.
> 
> We also have the interconnect target module to deal with for each
> module, and have the interconnect hierachy mapped in the devicetree.
> So we already have Linux driver module take care of the device
> hierarchy.
> 
> Because the child components are mostly independent, it should not
> matter in which order they suspend and resume related to each other.
> 
> I think the remaining issue is how dispc should provide services to
> the other components.
> 
> If dispc needs to be enabled to provide services to the other modules,
> maybe there's some better Linux generic framework dispc could implement?
> That is other than PM runtime calls for routing the signals to the
> output modules? Then PM runtime can be handled private to the dispc
> module.

What would be the difference? The dispc service would just call runtime 
get and put, like it does now, wouldn't it?

> Decoupling the system suspend and resume from PM runtime calls for
> all the other dss components should still also be done IMO. But that
> can be done as a separate clean-up patches after we have fixed the
> $subject issue.

I don't think I still really understand why all this is needed. I mean, 
obviously things don't work correctly at the moment, so maybe this patch 
can be applied to fix the system suspend. But it just feels like a big 
hack (the current pm_runtime_force_suspend/resume work-around feels like 
a big hack too).

Why doesn't the suspend just work? Afaics, the runtime PM code in 
omapdrm is fine: the dependencies work nicely, things get runtime 
suspended and resumes correctly. And at system suspend, omapdrm will 
disable the whole display pipeline (including bridges, panels) in a 
controlled manner, which results in the appropriate runtime PM calls. I 
think this should just work. But it doesn't, because... runtime PM and 
system suspend don't quite work well together? Or something.

So is it something that omapdrm is doing in a wrong way, or is the PM 
framework just messed up, and other drivers need to dance around the 
problems too?

>> Can we get the omapdrm suspend/resume to run first/last, and
>> stop/restart the whole device from there ?
> 
> This is already the case since commit ecfdedd7da5d ("drm/omap: force
> runtime PM suspend on system suspend"). We have omap_drv use
> SIMPLE_DEV_PM_OPS, and the components use SET_LATE_SYSTEM_SLEEP_PM_OPS.
> So omap_drv suspends first and resumes last. The order should not
> matter for other components. Well that is as long as we can deal
> with dispc providing resources.
> 
> I think we really should also change omap_drv use prepare/complete ops,
> and have the components use standard SIMPLE_DEV_PM_OPS. That still
> won't help with PM runtime related issues for system suspend and
> resume though, but leaves out the need for late pm ops.

Why do we need to do the above? What would omapdrm do in prepare & 
complete? Why would we use SIMPLE_DEV_PM_OPS for the dss subcomponents?

Slightly off topic, but I just noticed that we're using runtime_put_sync 
for some reason. Found 0eaf9f52e94f756147dbfe1faf1f77a02378dbf9. I've 
been fighting with system suspend for a long time =).

I wonder if using non-sync version would remove the EBUSY problem...

  Tomi
