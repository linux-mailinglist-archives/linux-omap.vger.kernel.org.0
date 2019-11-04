Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCA4EE6B9
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2019 18:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbfKDR4V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 Nov 2019 12:56:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:36008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727469AbfKDR4V (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 4 Nov 2019 12:56:21 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCCF520B7C;
        Mon,  4 Nov 2019 17:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572890180;
        bh=7cyK6XyXwCyMK199VyhDHPl6xB1Z4RKjzoptZaJbYyQ=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=Mo8G2CZB/N8Bsfzl7Y0GhjtwEh3gttQ2kNlASo9aRD9i4J1kEs/WuL8OFxCzzCBQF
         nUhuV0rSlQqu/aXn8BV2rDZUOmqIwm+dMCMYX6o/X0P4UXzuGLWbVNXM0QQn/wjqVk
         9MkVyiHVUT+N7t44HCrHVNMaWLIDUUlcSXcdXHCw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191002083436.10194-1-peter.ujfalusi@ti.com>
References: <20191002083436.10194-1-peter.ujfalusi@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: ti: dra7-atl-clock: Remove ti_clk_add_alias call
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>, mturquette@baylibre.com,
        t-kristo@ti.com
User-Agent: alot/0.8.1
Date:   Mon, 04 Nov 2019 09:56:20 -0800
Message-Id: <20191104175620.CCCF520B7C@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Peter Ujfalusi (2019-10-02 01:34:36)
> ti_clk_register() calls it already so the driver should not create
> duplicated alias.
>=20
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---

Applied to clk-fixes

