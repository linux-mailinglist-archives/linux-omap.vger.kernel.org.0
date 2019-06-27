Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7C4581C0
	for <lists+linux-omap@lfdr.de>; Thu, 27 Jun 2019 13:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbfF0LjI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Jun 2019 07:39:08 -0400
Received: from muru.com ([72.249.23.125]:53712 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726375AbfF0LjI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 27 Jun 2019 07:39:08 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 43780805C;
        Thu, 27 Jun 2019 11:39:30 +0000 (UTC)
Date:   Thu, 27 Jun 2019 04:39:04 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Faiz Abbas <faiz_abbas@ti.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, mark.rutland@arm.com,
        robh+dt@kernel.org, robertcnelson@gmail.com
Subject: Re: [PATCH] ARM: dts: am57xx: Disable voltage switching for SD card
Message-ID: <20190627113904.GI5447@atomide.com>
References: <20190619102454.5097-1-faiz_abbas@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619102454.5097-1-faiz_abbas@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Faiz Abbas <faiz_abbas@ti.com> [190619 03:25]:
> If UHS speed modes are enabled, a compatible SD card switches down to
> 1.8V during enumeration. If after this a software reboot/crash takes
> place and on-chip ROM tries to enumerate the SD card, the difference in
> IO voltages (host @ 3.3V and card @ 1.8V) may end up damaging the card.
> 
> The fix for this is to have support for power cycling the card in
> hardware (with a PORz/soft-reset line causing a power cycle of the
> card). Because the beaglebone X15 (rev A,B and C), am57xx-idks and
> am57xx-evms don't have this capability, disable voltage switching for
> these boards.
> 
> The major effect of this is that the maximum supported speed
> mode is now high speed(50 MHz) down from SDR104(200 MHz).
> 
> commit 88a748419b84 ("ARM: dts: am57xx-idk: Remove support for voltage
> switching for SD card") did this only for idk boards. Do it for all
> affected boards.

Thanks applying into fixes.

Regards,

Tony
