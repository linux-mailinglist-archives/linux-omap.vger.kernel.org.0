Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 247412749B5
	for <lists+linux-omap@lfdr.de>; Tue, 22 Sep 2020 22:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgIVUAg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Sep 2020 16:00:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:59626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgIVUAg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Sep 2020 16:00:36 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B56B220715;
        Tue, 22 Sep 2020 20:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600804835;
        bh=ZwnUe3Xjef2czjP4zjDspy9BSZFwXa1PlWeADD6pcZ0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=xVSs22pd66z/MbeOQjkT5niUDP48fUg0NpYDpOWslX8d0KJ4DrUsvdjQYF6v5u/nN
         JcuRW35923uC4ZnK61Kh5eI5USLwiZbHJCFBwV3we+qQkA3RGCqCtZ18C0P3xXWcOB
         0gxbTvwUTS4qC57w12ouGg2FV0OY11CWxurqrwOs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200907082600.454-3-t-kristo@ti.com>
References: <20200907082600.454-1-t-kristo@ti.com> <20200907082600.454-3-t-kristo@ti.com>
Subject: Re: [PATCH 2/3] clk: ti: clockdomain: fix static checker warning
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Date:   Tue, 22 Sep 2020 13:00:34 -0700
Message-ID: <160080483454.310579.2053719972531270257@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2020-09-07 01:25:59)
> Fix a memory leak induced by not calling clk_put after doing of_clk_get.
>=20
> Reported-by: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-next
