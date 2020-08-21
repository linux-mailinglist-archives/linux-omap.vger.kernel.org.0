Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D0024D66A
	for <lists+linux-omap@lfdr.de>; Fri, 21 Aug 2020 15:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728967AbgHUNqX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Fri, 21 Aug 2020 09:46:23 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:33618 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728911AbgHUNo5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Aug 2020 09:44:57 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E92EA1C0BB4; Fri, 21 Aug 2020 15:44:53 +0200 (CEST)
Date:   Fri, 21 Aug 2020 15:44:51 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, aford@beaconembedded.com,
        Beno??t Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] ARM: dts: omap3: Add cpu trips and cooling map for
 omap34/36 families
Message-ID: <20200821134451.GA3806@bug>
References: <20200817133931.11785-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200817133931.11785-1-aford173@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon 2020-08-17 08:39:31, Adam Ford wrote:
> The OMAP3530, OMAP3630, and DM3730 all show thresholds of 90C and 105C
> depending on commercial or industrial temperature ratings.
> 
> This patch expands the thermal information to include the limits of 90
> and 105C for alert and critical.  It sets the coolings-cells for the
> 34xx and 36xx CPU's which both point to omap3-cpu-thermal.dtsi.
> 
> For boards who never use industrial temperatures, these can be
> changed on their respective device trees with something like:
> 
> &cpu_alert0 {
> 	temperature = <85000>; /* millicelsius */
> };
> 
> &cpu_crit {
> 	temperature = <90000>; /* millicelsius */
> };

That should be the other way around. Provide safe values by default.

										Pavel
