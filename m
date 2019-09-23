Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46505BBB34
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2019 20:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438349AbfIWSXY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 Sep 2019 14:23:24 -0400
Received: from muru.com ([72.249.23.125]:34348 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438008AbfIWSXY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 23 Sep 2019 14:23:24 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 76DB0809F;
        Mon, 23 Sep 2019 18:23:55 +0000 (UTC)
Date:   Mon, 23 Sep 2019 11:23:20 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com, sre@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: omap2plus_defconfig: Enable DRM_TI_TFP410
Message-ID: <20190923182320.GB5610@atomide.com>
References: <20190911174647.29721-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911174647.29721-1-aford173@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190911 10:47]:
> The TFP410 driver was removed but the replacement driver was
> never enabled.  This patch enableds the DRM_TI_TFP410
> 
> Fixes: be3143d8b27f ("drm/omap: Remove TFP410 and DVI connector drivers")

Applying into fixes thanks.

Tony
