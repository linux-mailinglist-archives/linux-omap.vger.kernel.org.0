Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44371FD2D3
	for <lists+linux-omap@lfdr.de>; Wed, 17 Jun 2020 18:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgFQQvv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Jun 2020 12:51:51 -0400
Received: from muru.com ([72.249.23.125]:58106 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726341AbgFQQvv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 17 Jun 2020 12:51:51 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C4B9580F3;
        Wed, 17 Jun 2020 16:52:43 +0000 (UTC)
Date:   Wed, 17 Jun 2020 09:51:49 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Oskar Enoksson <enok@lysator.liu.se>
Cc:     linux-omap@vger.kernel.org
Subject: Re: WL1271 on CM-T3730
Message-ID: <20200617165149.GF37466@atomide.com>
References: <807d19b0-842f-87b9-c9ba-dcbfd4e7b108@lysator.liu.se>
 <20200616153921.GA37466@atomide.com>
 <a002d6ed-526a-bf82-b698-6182f9bb126e@lysator.liu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a002d6ed-526a-bf82-b698-6182f9bb126e@lysator.liu.se>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Oskar Enoksson <enok@lysator.liu.se> [200617 10:45]:
> Could someone please share a /proc/config.gz from some working board (with a
> recent kernel), just to eliminate the possibility of something wrong there
> after all?

Looks like I don't have it, but it was just omap2plus_defconfig really.

> And - are you using the omap3-cm-t3730.dtb or the omap3-sbc-t3730.dtb?

I'm using omap3-sbc-t3730.dtb as I have the "single board computer".

Regards,

Tony
