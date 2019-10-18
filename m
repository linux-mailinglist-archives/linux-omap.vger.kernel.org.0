Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3388DC213
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 12:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633227AbfJRKGf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 06:06:35 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:26944 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727249AbfJRKGf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 06:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571393185;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:Cc:Message-Id:Date:Subject:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=bdkSSLrzzXgOAov0Bq9bQG7oef0hHYLCGYDjTxAmiok=;
        b=ZYG2+Kr6HbfG+zUEVDm33s8bK+34MzSMgt0KySGpQ5ZzWXHEWUL4E64SyPICRNSp5D
        57lZ5CO2TClqVwFCp4mbui+oMgkBqWn2J4XQ/BH3FqQ7d3tMtyJt2kkxZDR289PghB7s
        y/9kwDj2wWDmT3vWXaqdCOsi/heowLmSx/z3xrjEJ94BTXZnUlFedYWrcHpVF7LqnPwN
        zAmGAEAogoi93QK9RWDht+rKOWM+550Df58+BbWZ8+2o3z2pNMXg9K+zQnb1Rb+2sUtu
        Pr3WPiHs3nx5Gf2AIw2Q+LCy5QlEK7987J42Mml+SMQIq1RPDFEyxyeKlav92jj99oJ4
        PCsg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaUXAwF5g=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
        with ESMTPSA id R0b2a8v9IA6PAqR
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Oct 2019 12:06:25 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: ARM: add __always_inline to functions called from __get_user_check()
Date:   Fri, 18 Oct 2019 12:06:23 +0200
Message-Id: <1823C41A-3296-4DEA-B71F-5AD548335F8B@goldelico.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,
I wonder what happened to your patch. We were "hit" by it in v5.4-rc1 and
after finding, it made our OMAP based device bootable again (using our
own defconfig which optimizes for SIZE).

But it does not seem to have arrived in linux-next and should IMHO
be fixed during the v5.4 release candidate cycle.

BR and thanks,
Nikolaus Schaller

