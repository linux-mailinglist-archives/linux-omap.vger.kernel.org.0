Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAA11664C1
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 18:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbgBTR1G (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 12:27:06 -0500
Received: from muru.com ([72.249.23.125]:56388 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728173AbgBTR1G (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 Feb 2020 12:27:06 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5518F8080;
        Thu, 20 Feb 2020 17:27:50 +0000 (UTC)
Date:   Thu, 20 Feb 2020 09:27:02 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     bcousson@baylibre.com, robh+dt@kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: dra7-evm: Rename evm_3v3 regulator to vsys_3v3
Message-ID: <20200220172702.GM37466@atomide.com>
References: <20200124121139.28657-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200124121139.28657-1-peter.ujfalusi@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Peter Ujfalusi <peter.ujfalusi@ti.com> [200124 04:11]:
> On the new schematics it is renamed and the same name is used on other
> dra7 boards.

Applying into fixes thanks.

Tony
