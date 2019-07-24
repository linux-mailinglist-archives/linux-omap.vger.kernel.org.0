Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F418B72EDA
	for <lists+linux-omap@lfdr.de>; Wed, 24 Jul 2019 14:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfGXM3h (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Jul 2019 08:29:37 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:60526 "EHLO mx2.freebsd.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726115AbfGXM3h (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Jul 2019 08:29:37 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mx1.freebsd.org", Issuer "Let's Encrypt Authority X3" (verified OK))
        by mx2.freebsd.org (Postfix) with ESMTPS id 36C4E6BAB6;
        Wed, 24 Jul 2019 12:23:42 +0000 (UTC)
        (envelope-from manu@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [IPv6:2610:1c1:1:606c::24b:4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         server-signature RSA-PSS (4096 bits)
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "smtp.freebsd.org", Issuer "Let's Encrypt Authority X3" (verified OK))
        by mx1.freebsd.org (Postfix) with ESMTPS id C907D77C77;
        Wed, 24 Jul 2019 12:23:41 +0000 (UTC)
        (envelope-from manu@freebsd.org)
Received: from localhost.localdomain (ip-9.net-89-3-105.rev.numericable.fr [89.3.105.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        (Authenticated sender: manu)
        by smtp.freebsd.org (Postfix) with ESMTPSA id B0E682BB03;
        Wed, 24 Jul 2019 12:23:40 +0000 (UTC)
        (envelope-from manu@freebsd.org)
From:   Emmanuel Vadot <manu@freebsd.org>
To:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-omap@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Emmanuel Vadot <manu@freebsd.org>
Subject: [PATCH 0/1] ARM: dts: am335x: Fix UARTs length
Date:   Wed, 24 Jul 2019 14:23:28 +0200
Message-Id: <20190724122329.21231-1-manu@freebsd.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C907D77C77
X-Spamd-Bar: --
Authentication-Results: mx1.freebsd.org
X-Spamd-Result: default: False [-2.94 / 15.00];
         TAGGED_RCPT(0.00)[dt];
         local_wl_from(0.00)[freebsd.org];
         NEURAL_HAM_SHORT(-0.94)[-0.940,0];
         NEURAL_HAM_MEDIUM(-1.00)[-1.000,0];
         ASN(0.00)[asn:11403, ipnet:2610:1c1:1::/48, country:US];
         NEURAL_HAM_LONG(-1.00)[-1.000,0]
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

For some reason the uart region size were set to 0x2000 while the TRM clearly
specify that the size is 0x1000.
I guess this is not a problem on Linux but for FreeBSD the resource manager will
not allow the mapping when the region declared in the parents is less that the one
declared in the child.

Emmanuel Vadot (1):
  ARM: dts: am335x: Fix UARTs length

 arch/arm/boot/dts/am33xx-l4.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.22.0

