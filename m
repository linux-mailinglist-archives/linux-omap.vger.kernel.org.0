Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EBAF1F1E38
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jun 2020 19:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387527AbgFHRQi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Jun 2020 13:16:38 -0400
Received: from muru.com ([72.249.23.125]:57310 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730697AbgFHRQh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Jun 2020 13:16:37 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D658E80E7;
        Mon,  8 Jun 2020 17:17:28 +0000 (UTC)
Date:   Mon, 8 Jun 2020 10:16:34 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] DRA7 timer/mailbox dts fixes
Message-ID: <20200608171634.GK37466@atomide.com>
References: <20200605221347.15735-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605221347.15735-1-s-anna@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [200605 15:14]:
> Hi Tony,
> 
> The following 2 patches are couple of minor fixes that clean up
> couple of commits from the "ARM: dts: dra7/am57xx: remoteproc
> support" series [1]. Please pick these for the 5.8-rc fixes.
> 
> The issues look to be result of incorrect rebase-conflict resolution
> of the downstream TI patches based on 5.4 kernel.

Thanks applying both into fixes.

Tony
