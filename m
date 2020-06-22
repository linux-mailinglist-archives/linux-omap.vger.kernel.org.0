Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69D22203AD4
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jun 2020 17:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729204AbgFVP22 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Jun 2020 11:28:28 -0400
Received: from muru.com ([72.249.23.125]:58578 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728293AbgFVP22 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 22 Jun 2020 11:28:28 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 40EDC8140;
        Mon, 22 Jun 2020 15:29:20 +0000 (UTC)
Date:   Mon, 22 Jun 2020 08:28:25 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Oskar Enoksson <enok@lysator.liu.se>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-omap@vger.kernel.org
Subject: Re: WL1271 on CM-T3730
Message-ID: <20200622152825.GK37466@atomide.com>
References: <807d19b0-842f-87b9-c9ba-dcbfd4e7b108@lysator.liu.se>
 <AD238A83-22FC-458D-9180-F715AD6A5237@goldelico.com>
 <d32e2c17-849a-4aa8-7f84-a84d9699789a@lysator.liu.se>
 <5166bacd-428d-168c-edf4-a322274deac6@lysator.liu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5166bacd-428d-168c-edf4-a322274deac6@lysator.liu.se>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Oskar Enoksson <enok@lysator.liu.se> [200621 22:01]:
> Correction: occasionally wl1271_sdio initialization still fails with error
> messages such as
> 
> [   46.961364] wl1271_sdio: probe of mmc1:0001:1 failed with error -16
> [   46.967834] wl1271_sdio: probe of mmc1:0001:2 failed with error -16
> 
> other times
> 
> [   27.302215][  T903] wl1271_sdio mmc1:0001:2: wl12xx_sdio_power_on: failed
> to get_sync(-22)
> 
> or
> root@pte2000:~# ifup wlan0
> [   53.799468][ T2420] wl1271_sdio mmc1:0001:2: wl12xx_sdio_power_on: failed
> to get_sync(-110)
> [   53.840118][ T2420] wl1271_sdio mmc1:0001:2: wl12xx_sdio_power_on: failed
> to get_sync(-22)
> [   53.879882][ T2420] wl1271_sdio mmc1:0001:2: wl12xx_sdio_power_on: failed
> to get_sync(-22)
> [   53.888610][ T2420] wlcore: ERROR firmware boot failed despite 3 retries
> RTNETLINK answers: Invalid argument
> ifup: failed to bring up wlan0

Maybe try changing the wl12xx_vmmc2 startup-delay-us to something
higher like 70000 we usually have?

Regards,

Tony
