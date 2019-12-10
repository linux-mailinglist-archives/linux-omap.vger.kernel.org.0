Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B485C118C4F
	for <lists+linux-omap@lfdr.de>; Tue, 10 Dec 2019 16:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfLJPRP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Dec 2019 10:17:15 -0500
Received: from muru.com ([72.249.23.125]:44596 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727211AbfLJPRP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Dec 2019 10:17:15 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3C33880E1;
        Tue, 10 Dec 2019 15:17:53 +0000 (UTC)
Date:   Tue, 10 Dec 2019 07:17:11 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Mans Rullgard <mans@mansr.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am335x-sancloud-bbe: fix phy mode
Message-ID: <20191210151711.GK35479@atomide.com>
References: <20191201170706.7173-1-mans@mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191201170706.7173-1-mans@mansr.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Mans Rullgard <mans@mansr.com> [191201 09:15]:
> The phy mode should be rgmii-id.  For some reason, it used to work with
> rgmii-txid but doesn't any more.

Applying into fixes thanks.

Tony
