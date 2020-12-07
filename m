Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3541D2D12F5
	for <lists+linux-omap@lfdr.de>; Mon,  7 Dec 2020 15:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgLGOBH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Dec 2020 09:01:07 -0500
Received: from muru.com ([72.249.23.125]:49838 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726489AbgLGOBG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 7 Dec 2020 09:01:06 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 32D298057;
        Mon,  7 Dec 2020 14:00:34 +0000 (UTC)
Date:   Mon, 7 Dec 2020 16:00:22 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: omap2plus_defconfig: enable SPI GPIO
Message-ID: <20201207140022.GB26857@atomide.com>
References: <20201201191237.15808-1-andreas@kemnade.info>
 <826AB7B5-E860-40D4-8E33-08F9FF820A98@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <826AB7B5-E860-40D4-8E33-08F9FF820A98@goldelico.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [201201 19:23]:
> 
> > Am 01.12.2020 um 20:12 schrieb Andreas Kemnade <andreas@kemnade.info>:
> > 
> > GTA04 uses that for controlling the td028ttec1 panel. So
> > for easier testing/bisecting it is useful to have it
> > enabled in the defconfig.
> 
> ++

Applying into omap-for-v5.11/defconfig-take2 thanks.

Tony
