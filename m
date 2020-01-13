Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD3EF139891
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jan 2020 19:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgAMSPq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jan 2020 13:15:46 -0500
Received: from muru.com ([72.249.23.125]:50776 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728680AbgAMSPq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 Jan 2020 13:15:46 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 08BD58047;
        Mon, 13 Jan 2020 18:16:26 +0000 (UTC)
Date:   Mon, 13 Jan 2020 10:15:42 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     =?utf-8?B?QW5kcsOp?= Hentschel <nerv@dawncrow.de>
Cc:     linux@arm.linux.org.uk, robh+dt@kernel.org, mark.rutland@arm.com,
        bcousson@baylibre.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] ARM: dts: Add omap3-echo
Message-ID: <20200113181542.GN5885@atomide.com>
References: <20200102214304.8225-1-nerv@dawncrow.de>
 <20200102214304.8225-2-nerv@dawncrow.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200102214304.8225-2-nerv@dawncrow.de>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* André Hentschel <nerv@dawncrow.de> [200102 21:44]:
> This is the first generation Amazon Echo from 2016.
> Audio support is not yet implemented.
> 
> Signed-off-by: André Hentschel <nerv@dawncrow.de>
> ---
> 
> v2: Don't disable sgx, as the previous patch changes dtsi files accordingly
> v3: Include dm3725.dtsi

Thanks applying both into omap-for-v5.6/dt.

Tony
