Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 151BF44AA81
	for <lists+linux-omap@lfdr.de>; Tue,  9 Nov 2021 10:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244817AbhKIJZt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Nov 2021 04:25:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244806AbhKIJZs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 9 Nov 2021 04:25:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2471BC061764
        for <linux-omap@vger.kernel.org>; Tue,  9 Nov 2021 01:23:03 -0800 (PST)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B60F6FD1;
        Tue,  9 Nov 2021 10:22:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636449780;
        bh=rECzhCin5c7MwPmmUtM6y9/8k7qGZLDHKYWc3rLq5lQ=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=AWSDroOu9zavj/n18tLDi7HgH8ZeO+cf6YcK+t6RP30hLqs2EHieM/KWk3KhjBw4B
         IAkWrh9rG5axpJYK59ikPyGYDjoJ0dhoA5g7Q5VHFRXmq9jTGKreFM6FcAD0IYwpxu
         RWrxpsgmtycuFfRKX8a8NhQ+WB0mhgLWxNMnOthM=
To:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <92fd80eb-6591-fb45-8885-309c79c2d4c0@gmail.com>
 <689ba705-c7fc-428c-3288-0c4adb3cc63f@gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: omapdrm VRFB rotation
Message-ID: <40c102c3-207b-e8ae-f292-aeff6b1515ce@ideasonboard.com>
Date:   Tue, 9 Nov 2021 11:22:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <689ba705-c7fc-428c-3288-0c4adb3cc63f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 08/11/2021 19:43, Ivaylo Dimitrov wrote:
> Sorry, mail was sent to the old Tomi's address.
> 
> On 8.11.21 г. 19:05 ч., Ivaylo Dimitrov wrote:
>> Hi,
>>
>> Currently omapdrm supports TILER rotation only, which excludes omap3 
>> and earlier SoCs. I have the hardware (N900/N950), time and will to 
>> implement VRFB rotation support in omapdrm driver, however, I'll 
>> appreciate some hints. Or, if there is already something ready, please 
>> point me to it so I can take it from where it is.
>>
>> Besides partially reverting 517a8a9564c0dea98e6d4e2c7f0fe4cbb9b8c9ba 
>> and copying VRFB code from omapfb, is there anything else I shall take 
>> in consideration? Or, VRFB driver should not be a part of omapdrm, but 
>> a standalone one?

We already have DMM driver in the omapdrm module, and I think VRFB fits 
along just fine. I don't think there ever has been any other users for 
VRFB than DSS, and as it's such an old IP, I don't think there ever will.

I don't have any particular hints in mind.

Do you have omap4/5 so you can test that DMM still works after your changes?

  Tomi
