Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD0A12D431
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2019 20:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727670AbfL3T6N (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Dec 2019 14:58:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:41874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727654AbfL3T6M (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 30 Dec 2019 14:58:12 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0356A206CB;
        Mon, 30 Dec 2019 19:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577735892;
        bh=RvJr8GIoaa2PCUfsrVJd4P6qxtZOkY55L711EnvRStE=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=mBqf0o3jSd8Pq0x9B87YCnt/kcB5s/6a5cu2rwD/xB7Oy5BHKXOrIhwfW3njkJqob
         O44NWxPSw5A9sDBcSOEezLYa1brdpl8b/UWy7OA75dOsIl+tyoaiKZhwlkIQGr5XCg
         1U4nHUvIZNln5vPw/VrvyAQ8Rx547OH97OcWw608=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191211140810.10657-2-bparrot@ti.com>
References: <20191211140810.10657-1-bparrot@ti.com> <20191211140810.10657-2-bparrot@ti.com>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
To:     Benoit Parrot <bparrot@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Tony Lindgren <tony@atomide.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [Patch v5 1/3] clk: ti: dra7: add vpe clkctrl data
User-Agent: alot/0.8.1
Date:   Mon, 30 Dec 2019 11:58:11 -0800
Message-Id: <20191230195812.0356A206CB@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Benoit Parrot (2019-12-11 06:08:08)
> Add clkctrl data for VPE.
>=20
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Acked-by: Tony Lindgren <tony@atomide.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

