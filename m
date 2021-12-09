Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E4A46E37B
	for <lists+linux-omap@lfdr.de>; Thu,  9 Dec 2021 08:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232286AbhLIHud (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Dec 2021 02:50:33 -0500
Received: from muru.com ([72.249.23.125]:36432 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230154AbhLIHud (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 9 Dec 2021 02:50:33 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 31B8480A3;
        Thu,  9 Dec 2021 07:47:41 +0000 (UTC)
Date:   Thu, 9 Dec 2021 09:46:57 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] ARM: dts: am335x: Use correct vendor prefix for
 Asahi Kasei Corp.
Message-ID: <YbG0cTdF98HWzqLY@atomide.com>
References: <20211206144802.217073-1-thierry.reding@gmail.com>
 <20211206144802.217073-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206144802.217073-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Thierry Reding <thierry.reding@gmail.com> [211206 16:48]:
> From: Thierry Reding <treding@nvidia.com>
> 
> The old "ak" vendor prefix that was never officially accepted was still
> being used in some device trees. Convert to the correct vendor prefix
> (i.e. "asahi-kasei").

Applying into omap-for-v5.17/dt thanks.

Tony
