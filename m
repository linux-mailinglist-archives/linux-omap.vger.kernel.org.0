Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD78A2642A8
	for <lists+linux-omap@lfdr.de>; Thu, 10 Sep 2020 11:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730268AbgIJJpD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 05:45:03 -0400
Received: from muru.com ([72.249.23.125]:44492 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730172AbgIJJpA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Sep 2020 05:45:00 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6D50C80F9;
        Thu, 10 Sep 2020 09:45:00 +0000 (UTC)
Date:   Thu, 10 Sep 2020 12:45:42 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Adrian Schmutzler <freifunk@adrianschmutzler.de>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: omap: replace status value "ok" by "okay"
Message-ID: <20200910094542.GB7101@atomide.com>
References: <20200830193859.40594-1-freifunk@adrianschmutzler.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200830193859.40594-1-freifunk@adrianschmutzler.de>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adrian Schmutzler <freifunk@adrianschmutzler.de> [200830 22:40]:
> While the DT parser recognizes "ok" as a valid value for the
> "status" property, it is actually mentioned nowhere. Use the
> proper value "okay" instead, as done in the majority of files
> already.

Thanks applying into omap-for-v5.10/dt.

Tony
