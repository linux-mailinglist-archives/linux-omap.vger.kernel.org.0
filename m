Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05408FD44
	for <lists+linux-omap@lfdr.de>; Tue, 30 Apr 2019 17:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfD3PyT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Apr 2019 11:54:19 -0400
Received: from muru.com ([72.249.23.125]:47678 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725930AbfD3PyS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 30 Apr 2019 11:54:18 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9FFBD80FB;
        Tue, 30 Apr 2019 15:54:35 +0000 (UTC)
Date:   Tue, 30 Apr 2019 08:54:15 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Faiz Abbas <faiz_abbas@ti.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, mark.rutland@arm.com,
        robh+dt@kernel.org, bcousson@baylibre.com
Subject: Re: [PATCH] ARM: dts: dra76x: Update MMC2_HS200_MANUAL1 iodelay
 values
Message-ID: <20190430155415.GI8007@atomide.com>
References: <20190430060856.18445-1-faiz_abbas@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430060856.18445-1-faiz_abbas@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Faiz Abbas <faiz_abbas@ti.com> [190429 23:09]:
> Update the MMC2_HS200_MANUAL1 iodelay values to match with the latest
> dra76x data manual[1].
> 
> Also this particular pinctrl-array is using spaces instead of tabs for
> spacing between the values and the comments. Fix this as well.

Is this needed as a fix or can this wait?

Regards,

Tony
