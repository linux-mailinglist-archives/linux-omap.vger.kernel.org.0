Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6232A00D2
	for <lists+linux-omap@lfdr.de>; Fri, 30 Oct 2020 10:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgJ3JJi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Oct 2020 05:09:38 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:16888 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgJ3JJi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Oct 2020 05:09:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604048974;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=5skifHevDR09DZ+3DcvL3A/4jheCtjdVQh+kEKKrLb4=;
        b=LBIV/ycNHz8wLXTnN0EEVFvpy0A3YHe2CdNALlyVEWYnj1yb7yY47j5YN4lYRddrXb
        HcxF/JmJHL/7AkVBY/+GezeyeBONKilF0ueD0rMr/VgZTzGOduwNcM7GPBMf1lHgZwpN
        oqesUl6mB/FszHjGJiWf5wxIRTNxONbnfa75N9cwomM4qpqM7UngwRdzKM+2/eLrMZ1Y
        5ci11UJJb0/5Na4IuD1t04TOr1V4ptsZAvyW6ymxy7S249iwxBE6ewwJqgxAmF3WGTf4
        v2Bn0D+9sBtIFoEBCpkmb/d1r0CRLlSRa537RqFrTdz+M7FefUCyeSX/9zyCIiuD4QzX
        ux3A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrqwDOs1yM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
        with ESMTPSA id R040bew9U99K5eT
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 30 Oct 2020 10:09:20 +0100 (CET)
Subject: Re: [PATCH 0/2] AMR: DTS: fix and extension for Pandaboard ES
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <cover.1601734200.git.hns@goldelico.com>
Date:   Fri, 30 Oct 2020 10:09:18 +0100
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Content-Transfer-Encoding: 7bit
Message-Id: <0EB41455-D489-4F38-A8F7-C264BAE8D903@goldelico.com>
References: <cover.1601734200.git.hns@goldelico.com>
To:     =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

ping

> Am 03.10.2020 um 16:09 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> 
> * fix wrong pinmux offset preventing the user button from working
> * add uart connection for bluetooth wl1271 hci
> 
> H. Nikolaus Schaller (2):
>  ARM: dts: pandaboard: fix pinmux for gpio user button of Pandaboard ES
>  ARM: dts: pandaboard es: add bluetooth uart for HCI
> 
> arch/arm/boot/dts/omap4-panda-es.dts | 34 +++++++++++++++++++++++++++-
> 1 file changed, 33 insertions(+), 1 deletion(-)
> 
> -- 
> 2.26.2
> 

