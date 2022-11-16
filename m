Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4799462CD6A
	for <lists+linux-omap@lfdr.de>; Wed, 16 Nov 2022 23:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbiKPWMG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Nov 2022 17:12:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234852AbiKPWME (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Nov 2022 17:12:04 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8FF67F72
        for <linux-omap@vger.kernel.org>; Wed, 16 Nov 2022 14:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Xt3OWjKOEfdRH1gHZaPd5M0jNQFgnP2n84v8jd8hRzM=; b=t3B4xfuTWb6qZm33AuRBSLpviZ
        hTJYoFtyfNTFCpsKbNVq2EY/mZL/1X6PxLckmPOkbL9G1aN1dBT2EcNoFkOghCd/zdAmJhYQal5Si
        cuAW4dsRE23tpvxaNvdggBum8B1TkDjPFxuq6g+qripSC9eAOBZ6wXUZGTV3HNqXW0GEAn0wIZmy0
        hY5Q8l2gZWRM3CXCwqIBpvsUzZT2Db34kwLLGX2U6aGRQw7fLbRdRFCUtFJaLio2h1A0nAx9fGGvT
        cnDOim6frH/CwYfI8uv8WmSoGRG700tXl9TxjiHR79D8NKq1tmDFBiMNjf0IYS8U2BCOe9cQiRiep
        wDqV3hFQ==;
Received: from p200300ccff0625001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff06:2500:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ovQdT-0001x1-Mv
        for linux-omap@vger.kernel.org; Wed, 16 Nov 2022 23:11:59 +0100
Date:   Wed, 16 Nov 2022 23:11:58 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     linux-omap@vger.kernel.org
Subject: omap4-keypad mystery
Message-ID: <20221116231146.2edf8322@aktux>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

I am investigating how to use the omap4 keypad driver in dts and I am quite
confused. Nobody seems to add any pinmux to it. Why?

I muxed the rows0-3 and cols0-3 to MODE1 without any wakeup.

When I set /sys/bus/platform/devices/4a31c000.keypad/power/control
to on I get keypad interrupts and events in evtest. but with it set to auto,
nothing happens. Setting the rows pinmux to 0x4119 instead of 0x119 does not
change anything.

Nobody seems to add provisions to wake up independently of the keypad
hwmod which seems to be odd. I would expect interrupt-extended along with
the keypad definitions.

Confused,
Andreas
