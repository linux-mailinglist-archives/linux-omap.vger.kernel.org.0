Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7E63A3B4D
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jun 2021 07:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhFKFVE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 01:21:04 -0400
Received: from muru.com ([72.249.23.125]:41598 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230212AbhFKFVD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Jun 2021 01:21:03 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E627A80E1;
        Fri, 11 Jun 2021 05:19:13 +0000 (UTC)
Date:   Fri, 11 Jun 2021 08:19:02 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v2] dt-bindings: serial: Move omap-serial.txt to YAML
 schema
Message-ID: <YMLyRoHWgGAy2lXh@atomide.com>
References: <20210610182227.2480-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610182227.2480-1-vigneshr@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Vignesh Raghavendra <vigneshr@ti.com> [210610 18:22]:
> Convert serial-omap.txt to YAML schema for better checks and documentation.

Looks good to me thanks:

Acked-by: Tony Lindgren <tony@atomide.com>
