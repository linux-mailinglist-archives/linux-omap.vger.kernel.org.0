Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0C3828C40C
	for <lists+linux-omap@lfdr.de>; Mon, 12 Oct 2020 23:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgJLV3x (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Oct 2020 17:29:53 -0400
Received: from vern.gendns.com ([98.142.107.122]:50618 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726348AbgJLV3x (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 12 Oct 2020 17:29:53 -0400
X-Greylist: delayed 1011 seconds by postgrey-1.27 at vger.kernel.org; Mon, 12 Oct 2020 17:29:52 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BU8Y8hbTrSCDGFXXrVu4H2rvAgBqEv+1vUT0kZBE8Zw=; b=NLO+BUL9kg7v6b8w+g7ohEzKQ4
        b5P8SAikT8ovGIopkjef6GIrhawJjABW0MJW41HHaX0Ptv32x4Rrt6+ef7x1gcMTsNMOA1UEiuIAF
        JuzwdxicA8VF+5WbRIAjx6Ts5JOKXN6nxI9es8bkuQwcxrwsN0WE8qvAYzIkY4oLD/Vj69xaa/EZE
        LtKj3G85XQMC2/i+LXff9f9qvpA/+Fo4J3svfRYKP0nHik41R3cjSMPwbSNzYVFUThXQz791qk4JU
        L/Eg2Y6z4+47Lnx35xwiNXe3bPkp3fTFQlJ/nh9O8k6jXAN5WJcIYHO3gJ7sUbozIcf79Yvdym4Af
        jYEUuHqA==;
Received: from [2600:1700:4830:165f::19e] (port=52666 helo=freyr.lechnology.com)
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1kS57r-0004Ih-Dt; Mon, 12 Oct 2020 17:12:59 -0400
From:   David Lechner <david@lechnology.com>
To:     linux-omap@vger.kernel.org
Cc:     David Lechner <david@lechnology.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Drew Fustini <drew@beagleboard.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Enable eQEP counter driver on BeagleBone Blue
Date:   Mon, 12 Oct 2020 16:12:26 -0500
Message-Id: <20201012211229.3282128-1-david@lechnology.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This series adds device tree nodes for the eQEP portion of the PWMSS on AM33xx
and enables it on BeagleBone Blue.

I actually submitted these a year ago, but it looks like these patches never got
applied with the actual eQEP driver when it was merged.

For reference, there was some previous discussion about the clocks in "ARM: dts:
am33xx: Add nodes for eQEP". [1]

[1]: https://lore.kernel.org/linux-omap/20190723145100.GS5447@atomide.com/

I have also included a new patch to enable the eQEP driver in the defconfig.


David Lechner (3):
  ARM: dts: am33xx: Add nodes for eQEP
  ARM: dts: am335x-boneblue: Enable eQEP
  ARM: omap2plus_defconfig: Enable TI eQEP counter driver

 arch/arm/boot/dts/am335x-boneblue.dts | 54 +++++++++++++++++++++++++++
 arch/arm/boot/dts/am33xx-l4.dtsi      | 27 ++++++++++++++
 arch/arm/configs/omap2plus_defconfig  |  2 +
 3 files changed, 83 insertions(+)

-- 
2.25.1

