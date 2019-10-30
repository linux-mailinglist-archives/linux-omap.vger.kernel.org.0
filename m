Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4661CE9841
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2019 09:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbfJ3IkB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Oct 2019 04:40:01 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:12658 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfJ3IkB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Oct 2019 04:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1572424796;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ytcblrQ9momi5mrUnfe2JEwJ9Mxpgs6jMh2V+tmJuCc=;
        b=nlo2Buu3DZ5rZPdLyBiKsNJZxoY82t5YeZT8XYxJkP2Dd+PWitgLp0F4JA5pxE5CJw
        F9VXsEuaYRopoOids9/Ma3wd2cWM8UYr8I8pY86udjfqv3kPy+a9BxZMoctG4hxA8Hyh
        lZgXHVg160KiSJ0Gy6eNIf4pKVyfooxjNTIm51+dyC4cPVKS8xsyvo/4oEdcIjzQDeeo
        t6ThIA8JASUxMay7jibiQiFYuZBLyOeJUD10+E0eP14+M31cXC3ifHRgk5/xwpOvrRq0
        6U5H3klWDkxTB4KxYM06pfYD3XG4waO3L89OkRenPWH3/u11m+ZrhU13BgR+BQGwyAW7
        lIxw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrpwDvG"
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3v9U8dg1tu
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 30 Oct 2019 09:39:42 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [RFC v2 1/2] ARM: dts: omap3: Add cpu trips and cooling map for omap3 family
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHCN7xLN+52ZW6tzCQPDvwqrdgaQaMrkhPFPotYDr7RdNwqeNA@mail.gmail.com>
Date:   Wed, 30 Oct 2019 09:39:45 +0100
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>, Nishanth Menon <nm@ti.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Grazvydas Ignotas <notasas@gmail.com>
Content-Transfer-Encoding: 7bit
Message-Id: <C469028D-959D-4BD1-9226-C0190A197CE5@goldelico.com>
References: <20190913153714.30980-1-aford173@gmail.com> <B710D701-6311-4344-BF4E-F39157BBF2BD@goldelico.com> <CAHCN7xKU1v-BFkwiuZQx82+Cmdgj_1CH1j51bN0TaaduWcu8rQ@mail.gmail.com> <97204F98-FA33-4EBA-80AC-2FB3A6E78B2B@goldelico.com> <CAHCN7xJus=Unsm5rvgtccM9jpdiwGnJXrfjhavwkoswGbNd7qw@mail.gmail.com> <CAHCN7x+=O6f4Q0ps1d5KA+-E9L-8wr5B9XggzurJWtEnxEj7yg@mail.gmail.com> <FD6FED45-EF20-49D8-A2B2-012FB314DCC6@goldelico.com> <CAHCN7xLN+52ZW6tzCQPDvwqrdgaQaMrkhPFPotYDr7RdNwqeNA@mail.gmail.com>
To:     Adam Ford <aford173@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,
what is the status of this RFC/PATCH?

BR and thanks,
Nikolaus

