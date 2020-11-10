Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE40E2AD7C7
	for <lists+linux-omap@lfdr.de>; Tue, 10 Nov 2020 14:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730432AbgKJNil (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Nov 2020 08:38:41 -0500
Received: from muru.com ([72.249.23.125]:47966 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730534AbgKJNil (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Nov 2020 08:38:41 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0FAD880BA;
        Tue, 10 Nov 2020 13:38:46 +0000 (UTC)
Date:   Tue, 10 Nov 2020 15:38:37 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     robh+dt@kernel.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH  v4] ARM: dts: mapphone: remove xt894 specific things
 from motorola-mapphone-common.dtsi and add them to omap4-droid4-xt894.dts
 and omap4-droid-bionic-xt875.dts as applicable.
Message-ID: <20201110133837.GL26857@atomide.com>
References: <20201108194956.e7f184a7bd2331907dbbe4d0@uvos.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201108194956.e7f184a7bd2331907dbbe4d0@uvos.xyz>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Carl Philipp Klemm <philipp@uvos.xyz> [201108 18:50]:
> ARM: dts: mapphone: remove xt894 specific things from
> motorola-mapphone-common.dtsi and add them to omap4-droid4-xt894.dts
> and omap4-droid-bionic-xt875.dts as applicable.

Thanks applying for v5.11 after removing the extra "ARM: dts:..." from
the patch description that should be in the subject only. I also changed
the subject to "ARM: dts: mapphone: separate out xt894 specific things"
as it should be short.

Regards,

Tony
