Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33ED29E41E
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 08:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728743AbgJ2Hek (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Oct 2020 03:34:40 -0400
Received: from muru.com ([72.249.23.125]:47110 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727761AbgJ2HeS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 29 Oct 2020 03:34:18 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C6B35807E;
        Thu, 29 Oct 2020 06:18:23 +0000 (UTC)
Date:   Thu, 29 Oct 2020 08:18:15 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     robh+dt@kernel.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2]  ARM: dts: xt875: Improve dts support for Motorola
 XT875
Message-ID: <20201029061815.GG5639@atomide.com>
References: <20201023180613.830f83ea384ac26f3a22eaf8@uvos.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023180613.830f83ea384ac26f3a22eaf8@uvos.xyz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Carl Philipp Klemm <philipp@uvos.xyz> [201023 19:21]:
> Remove xt894 specific things from motorola-mapphone-common.dtsi and add them to omap4-droid4-xt894.dts and omap4-droid-bionic-xt875.dts as applicable.

Applying for v5.11 after wrapping the commit message. BTW, you can check
that with scripts/checkpatch.pl --strict :)

Regards,

Tony
