Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0571030ECCD
	for <lists+linux-omap@lfdr.de>; Thu,  4 Feb 2021 07:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbhBDG5P (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 4 Feb 2021 01:57:15 -0500
Received: from muru.com ([72.249.23.125]:56964 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232917AbhBDG5O (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 4 Feb 2021 01:57:14 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0C75180C5;
        Thu,  4 Feb 2021 06:56:45 +0000 (UTC)
Date:   Thu, 4 Feb 2021 08:56:30 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Ivan Jelincic <parazyd@dyne.org>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] ARM: omap2plus_defconfig: Update for dropped options.
Message-ID: <YBuankYwwMsG4MN9@atomide.com>
References: <20210203113426.18964-1-parazyd@dyne.org>
 <20210203113426.18964-2-parazyd@dyne.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203113426.18964-2-parazyd@dyne.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ivan Jelincic <parazyd@dyne.org> [210203 13:35]:
> Update omap2plus_defconfig for options that have been dropped:
> 
> - SIMPLE_PM_BUS no longer selected.

Oh right, we now need to always select it. Will queue this for
fixes after the merge window. The other one I'll be queueing
for v5.13 as the merge window is about to open and I'll only
queue fixes for the next few weeks :)

Regards,

Tony
