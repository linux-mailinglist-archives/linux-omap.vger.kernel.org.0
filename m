Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5735C325F9B
	for <lists+linux-omap@lfdr.de>; Fri, 26 Feb 2021 10:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhBZJFf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Feb 2021 04:05:35 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47252 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhBZJFA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 26 Feb 2021 04:05:00 -0500
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E42FA580;
        Fri, 26 Feb 2021 10:04:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614330258;
        bh=yIpmxN7Z8oDZ8M0v2OcPa9PuHtYgJXo1yHHaSGE5WFs=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=HheCQlLEzswKAyL3R3lkjOLTXPmy0Oxc6vknICjPDHzHpC0r6qukmaO3hJsOlkeCW
         QWBI6/51TPPNLf3xLsH50QWBCCvk8BnFsc3sOwhW+SLw+mgxhl75p8Y8U0SQQvzWvq
         BnzL4XIqtIRxRumrvdROQ0Qed44b9o2O0eyTYP6g=
To:     Tony Lindgren <tony@atomide.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, hns@goldelico.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-25-tomi.valkeinen@ti.com>
 <YCF7ARchcMKvWa4s@atomide.com>
 <5b469566-c926-7e1f-8872-84774b96f389@ideasonboard.com>
 <YCVq8JnuMLQq6FEc@atomide.com>
 <4432cf2c-fe15-dab0-3034-789f6d711396@ideasonboard.com>
 <YC4Bte47SFKVgrqX@atomide.com>
 <7c852efd-560a-4dbb-ed04-e4812b343a33@ideasonboard.com>
 <YDecMzuPaXGS/n5l@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v4 24/80] drm/omap: dsi: move TE GPIO handling into core
Message-ID: <0eb62659-041d-d3bd-3803-4d562677dfbf@ideasonboard.com>
Date:   Fri, 26 Feb 2021 11:04:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDecMzuPaXGS/n5l@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 25/02/2021 14:46, Tony Lindgren wrote:
> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210222 08:47]:
>> On 18/02/2021 07:57, Tony Lindgren wrote:
>>> Oh cool that you have those running again/still :) In this case there
>>> is no te-gpios if that might make a difference.
>>
>> No, GPIO TE is not used on OMAP4 SDP either.
> 
> OK
> 
>>>> So these errors start from the boot? Or only when running something
>>>> specific?
>>>
>>> They start from the boot when modules are loaded.
>>
>> Normally there are no updates happening unless an userspace app is
>> running, but I guess you have fb console enabled, with the blinking
>> cursor which makes the updates.
>>
>> I usually don't have fbcon enabled, but OMAP4 SDP works fine for me with
>> fbcon too...
> 
> I'm using loadable modules with omap2plus_defconfig in case that makes
> a difference. Maybe there's some state preserved somewhere if deferred
> probe happens?

I don't think the drivers do much unless probe succeeds. I'm also using 
modules.

>>>> Is there a bootloader that initializes the display?
>>>
>>> Yes it boots with kexec.
>>
>> Is that open source? Can you disable the display setup from the
>> bootloader? Maybe the DSS or the panel is left into a state that for
>> whatever reason makes the kernel drivers break.
> 
> Well that's a signed kernel booting kexec. But it has been working
> just fine for years now so I'd rather not blame that.

I'm just looking for the difference with droid4 and omap4 sdp so that I 
could reproduce.

>> Or maybe a DSS or DSI reset via SYSCONFIG at probe would help, or panel
>> reset if it has such a feature.
> 
> Maybe. But why would the $subject patch cause the errors?

Hmm, if I read the code right, TE was not enabled at all before this 
patch. And this patch enables it. So maybe TE has never worked with that 
panel?

You could try changing the enable_te calls to pass false.

Or with the upstream driver, comment out

mipi_dsi_dcs_set_tear_on(ddata->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);

  Tomi
