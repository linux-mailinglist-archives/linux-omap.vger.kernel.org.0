Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAD7C2530
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 18:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732329AbfI3Qca (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 12:32:30 -0400
Received: from muru.com ([72.249.23.125]:34940 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727767AbfI3Qc3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 30 Sep 2019 12:32:29 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id AF35D80FA;
        Mon, 30 Sep 2019 16:33:01 +0000 (UTC)
Date:   Mon, 30 Sep 2019 09:32:25 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] ARM: dts: am4372: Set memory bandwidth limit for DISPC
Message-ID: <20190930163225.GI5610@atomide.com>
References: <20190930085450.15874-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190930085450.15874-1-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [190930 01:55]:
> From: Peter Ujfalusi <peter.ujfalusi@ti.com>
> 
> Set memory bandwidth limit to filter out resolutions above 720p@60Hz to
> avoid underflow errors due to the bandwidth needs of higher resolutions.
> 
> am43xx can not provide enough bandwidth to DISPC to correctly handle
> 'high' resolutions.

Applying into fixes thanks.

Tony
