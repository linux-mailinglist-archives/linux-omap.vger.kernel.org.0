Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2841F697C
	for <lists+linux-omap@lfdr.de>; Thu, 11 Jun 2020 15:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgFKN7S (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Jun 2020 09:59:18 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37596 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgFKN7R (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 11 Jun 2020 09:59:17 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05BDwvWK123801;
        Thu, 11 Jun 2020 08:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591883937;
        bh=vm6dEZBsilsx43enScI+BD49SWDr4ySN9rl3BtNbgmk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=tcZyQjBo76EqNJpxeti///VQAcFdzyw9PMHY1rnerSEoaSnxotNdpO6RqXAbLRWRo
         ZQYf0FOrLwXIH71T8fVsJjXz3YEy1Oo1Pa75nEOb/O0BNE5s4Ij5AFgp6ir6+tAN3R
         zm3kGFoP43Y9vVR7fYrvCs9f50JG7Xuu7ky9tk4o=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05BDwvkJ035414
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 11 Jun 2020 08:58:57 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Jun 2020 08:58:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Jun 2020 08:58:57 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BDwrlD054159;
        Thu, 11 Jun 2020 08:58:53 -0500
Subject: Re: [PATCH 1/5] drm/omap: Fix suspend resume regression after
 platform data removal
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, "Andrew F . Davis" <afd@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <dri-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200531193941.13179-1-tony@atomide.com>
 <20200531193941.13179-2-tony@atomide.com>
 <16ba1808-5c7f-573d-8dd0-c80cac2f476e@ti.com>
 <20200603140639.GG37466@atomide.com>
 <47e286dd-f87a-4440-5bde-1f7b53e8b672@ti.com>
 <20200609151943.GL37466@atomide.com>
 <9ed70121-2a53-d2b3-051a-88eb83e6c53f@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <d03dd04f-6f2c-25ba-fe1f-d5fc0dfb5c68@ti.com>
Date:   Thu, 11 Jun 2020 17:00:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <9ed70121-2a53-d2b3-051a-88eb83e6c53f@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 09/06/2020 18:26, Tomi Valkeinen wrote:
> On 09/06/2020 18:19, Tony Lindgren wrote:
>>> But there's an extra runtime PM reference (dev.power.usage_count) that seems
>>> to come out of nowhere. So when omap_drm_suspend is finished, there's still
>>> usage_count of 1, and dispc never suspends fully.
>>
>> Hmm no idea about that. My guess is that there might be an issue that was
>> masked earlier with omap_device calling the child runtime_suspend.
> 
> Yes. It's how PM works. It calls pm_runtime_get_noresume() before starting the suspend of a device. So I guess omapdrm's suspend has been broken all the time, but it was "fixed" by omap_device.
> 

I think I might have an idea what is going wrong.

Before:
+----------------------+
|omap_device_pm_domain |
+---------------+------+------+
                 | device      |
                 +-------------+
                 | omap_device |
                 +-------------+

omap_device is embedded in DD device and PM handled by omap_device_pm_domain.

static int _od_suspend_noirq(struct device *dev)
{
...

	ret = pm_generic_suspend_noirq(dev);
[1] ^^ device suspend_noirq call

	if (!ret && !pm_runtime_status_suspended(dev)) {
		if (pm_generic_runtime_suspend(dev) == 0) {
[2] ^^ device pm_runtime_suspend force call

			omap_device_idle(pdev);
[3] ^^ omap_device disable
			od->flags |= OMAP_DEVICE_SUSPENDED;
		}
	}

	return ret;
}

Now:
+------------+
|ti sysc dev |
+-+----------+
   |
   |
   |   +-------------+
   |   | device      |
   +-->+             |
       +-------------+

With new approach the omap_device is not embedded in DD Device anymore,
instead ti-sysc (hwmod replacement) became parent of DD Device.

As result suspend sequence became the following
(Note. All PM runtime PUT calls became NOP during suspend by design):

device
|-> suspend() - in case of dss omap_drm_suspend() and Co if defined
|-> suspend_noirq() - in case of dss *not defined", equal to step [1] above
..

ti sysc dev (ti-sysc is parent, so called after device)
|-> sysc_noirq_suspend
    |-> pm_runtime_force_suspend()
	|-> sysc_runtime_suspend() - equal to step [3] above

And step [2] is missing as of now!

I think, suspend might be fixed if all devices, which are now child of ti-sysc, will do
pm_runtime_force_xxx() calls at noirq suspend stage by adding:

	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
				      pm_runtime_force_resume)

Am I missing smth?

-- 
Best regards,
grygorii
