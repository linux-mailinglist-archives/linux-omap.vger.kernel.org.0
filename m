Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 826E5423923
	for <lists+linux-omap@lfdr.de>; Wed,  6 Oct 2021 09:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237562AbhJFHsN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Oct 2021 03:48:13 -0400
Received: from muru.com ([72.249.23.125]:41376 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237470AbhJFHsN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Oct 2021 03:48:13 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8562F80E7;
        Wed,  6 Oct 2021 07:46:51 +0000 (UTC)
Date:   Wed, 6 Oct 2021 10:46:19 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     bcousson@baylibre.com, robh+dt@kernel.org, hns@goldelico.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Subject: Re: [PATCH 0/5] arm: dts: omap3-gta04: dtbs_check fixes
Message-ID: <YV1USyfoBsrRQQiC@atomide.com>
References: <20211001073416.2904733-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001073416.2904733-1-andreas@kemnade.info>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andreas Kemnade <andreas@kemnade.info> [211001 10:35]:
> This series fixes some errors found by make dtbs_check. Most
> do not fix functional issues, just syntax but one typo was
> unveiled by make dtbs_check which only caused no problems by
> luck.

Thanks applying all into omap-for-v5.16/dt.

Tony
