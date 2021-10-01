Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C85F41E909
	for <lists+linux-omap@lfdr.de>; Fri,  1 Oct 2021 10:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbhJAIY1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Oct 2021 04:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbhJAIY0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Oct 2021 04:24:26 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DABC061775;
        Fri,  1 Oct 2021 01:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pPNITRfk/+DdrQC1VBhJPHKrVKVH0S2nRMBzEmUJscs=; b=YZwao7UC3Vw4kdGsWqEjhc96wp
        4WBgiHs3TbdWX1m3yUNwcyKaWtH09EA+0q4fruXRxGq/C/m+YBV4VeJvovpu62Md/IeM37b/1n4dV
        hPcdagOgq/bzzDpx0s1jcmW887SpQrSqXhnM3ZiZE9SXE0nCymqur5Xhd3KjiY400OBc=;
Received: from p200300ccff0b42001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:4200:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mWDoU-00024p-Fr; Fri, 01 Oct 2021 10:22:38 +0200
Date:   Fri, 1 Oct 2021 10:22:37 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        devicetree@vger.kernel.org
Subject: strange dtbs_check error message regarding 8250_omap.yaml + serdev
 + gnss
Message-ID: <20211001102237.4db23bff@aktux>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

while doing some make dtbs_check cleanup I came across this message:

/home/andi/kernel/linux/arch/arm/boot/dts/omap3-gta04a4.dt.yaml: serial@4806c000: 'gnss' does not match any of the regexes: 'pinctrl-[0-9]+'
        From schema: /home/andi/kernel/linux/Documentation/devicetree/bindings/serial/8250_omap.yaml

the corresponding snippet is this one:

&uart2 {
        pinctrl-names = "default";
        pinctrl-0 = <&uart2_pins>;
        gnss: gnss {
                compatible = "wi2wi,w2sg0004";
                pinctrl-names = "default";
                pinctrl-0 = <&gps_pins>;
                sirf,onoff-gpios = <&gpio5 17 GPIO_ACTIVE_HIGH>;
                lna-supply = <&vsim>;
                vcc-supply = <&ldo_3v3>;
        };
};


I see a pattern for serdev objects in
Documentation/devicetree/bindings/serial/serial.yaml

patternProperties:
  ".*":
    if:
      type: object
    then:
      description:
        Serial attached devices shall be a child node of the host UART device
        the slave device is attached to. It is expected that the attached
        device is the only child node of the UART device. The slave device node
        name shall reflect the generic type of device for the node.


so I would say, everything is allowed. serial.yaml is referenced by
8250_omap.yaml. So what is the problem here?

Regards,
Andreas
