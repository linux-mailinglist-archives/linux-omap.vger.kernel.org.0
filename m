Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF0883477EA
	for <lists+linux-omap@lfdr.de>; Wed, 24 Mar 2021 13:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232848AbhCXMKL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 08:10:11 -0400
Received: from muru.com ([72.249.23.125]:46546 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232545AbhCXMKA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Mar 2021 08:10:00 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7FAE18057;
        Wed, 24 Mar 2021 12:10:56 +0000 (UTC)
Date:   Wed, 24 Mar 2021 14:09:56 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Dario Binacchi <dariobin@libero.it>
Cc:     linux-kernel@vger.kernel.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 3/4] ARM: dts: am33xx-clocks: add spread spectrum
 support
Message-ID: <YFssFDD1TspUXCOo@atomide.com>
References: <20210318172627.12173-1-dariobin@libero.it>
 <20210318172627.12173-4-dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318172627.12173-4-dariobin@libero.it>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Dario Binacchi <dariobin@libero.it> [210318 17:28]:
> Registers for adjusting the spread spectrum clocking (SSC) have been
> added. As reported by the TI spruh73x RM, SSC is supported only for
> LCD and MPU PLLs.

Probably best to keep the series together:

Acked-by: Tony Lindgren <tony@atomide.com>
