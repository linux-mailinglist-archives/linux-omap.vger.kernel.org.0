Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9D8124FA0
	for <lists+linux-omap@lfdr.de>; Wed, 18 Dec 2019 18:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbfLRRq1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Dec 2019 12:46:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:55470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727025AbfLRRq1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Dec 2019 12:46:27 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4549720665;
        Wed, 18 Dec 2019 17:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576691186;
        bh=8zXw6tjHGati9ef7QoVKO5LxBDc+7MUh7/cacqBUdvE=;
        h=In-Reply-To:References:Cc:Subject:From:To:Date:From;
        b=HNFhkTyNwgfuJ+fJLGE/zt7fG1h3JfQN2IM3/kNtqOctutemwVHvdF6nH59rNvnn4
         SXrIiPgUsswhX4BMQ2kcXowye7vEDnYXIw6t9V3oF40QcZDUvV08y4vxSJkCzeI7hO
         VE3wDwY9cMTzJdZHG5QTSl1M/6lYrj7UJ6h0hcv8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191109142017.10851-1-grygorii.strashko@ti.com>
References: <20191109142017.10851-1-grygorii.strashko@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] clk: ti: dra7: fix parent for gmac_clkctrl
From:   Stephen Boyd <sboyd@kernel.org>
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
User-Agent: alot/0.8.1
Date:   Wed, 18 Dec 2019 09:46:25 -0800
Message-Id: <20191218174626.4549720665@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Grygorii Strashko (2019-11-09 06:20:17)
> The parent clk for gmac clk ctrl has to be gmac_main_clk (125MHz) instead
> of dpll_gmac_ck (1GHz). This is caused incorrect CPSW MDIO operation.
> Hence, fix it.
>=20
> Fixes: commit dffa9051d546 ('clk: ti: dra7: add new clkctrl data')

There shouldn't be 'commit' in a Fixes: line.

