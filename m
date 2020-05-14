Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359F41D3E03
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 21:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728683AbgENTzD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 15:55:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:47514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727777AbgENTzD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 May 2020 15:55:03 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B9A752065D;
        Thu, 14 May 2020 19:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589486102;
        bh=h4cnn03L85W/QhP3dTr8UAM+uAkiBWq+QIcca/4hhmQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TcnWd3aEWP9k0KfKpJeAbyqw0oQpF9GDFIAgFMUVg5n7+XOrSTBhCcJBGEHuSLHoh
         C2PIfWSieJpuYscGp8xkYK21qBTAKKObCuGrvaL87XBEAT+qoJrSV3jHLnT85Oiu8J
         koC2a5kSg27ebcH6XvaiG+OO7FEDoYgBZ4cUzdBU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200429131341.4697-4-t-kristo@ti.com>
References: <20200429131341.4697-1-t-kristo@ti.com> <20200429131341.4697-4-t-kristo@ti.com>
Subject: Re: [PATCH 3/3] clk: ti: omap5: Add proper parent clocks for l4-secure clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Thu, 14 May 2020 12:55:02 -0700
Message-ID: <158948610213.215346.16370562747701803146@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Tero Kristo (2020-04-29 06:13:41)
> L4 secure clocks do not have their parents set currently, which ends
> them up to the orphan clock list. Fix this by adding either l3 or l4
> clock as their parent.
>=20
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-next
