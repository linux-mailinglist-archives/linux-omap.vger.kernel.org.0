Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8348266DBE2
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jan 2023 12:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235874AbjAQLIg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Jan 2023 06:08:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236587AbjAQLIS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Jan 2023 06:08:18 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31AF2B607
        for <linux-omap@vger.kernel.org>; Tue, 17 Jan 2023 03:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=NbBnq9Ui0Z4KuI19pS9K28V43NTN3sexiDT5wy+z8tI=; b=xNcZqUd/2ISf2c7/CnTkU9xCph
        iYFWXMr61KAvG9f4qlSjVTf6U/YSvhJkTS+XIu9VgrSEoGFfMaQBG3TuOJ2O5Fpc1Kr4PDq4KT0B0
        RNH0Q4LmyRIWpZ3A+CbYeWaxpLbuq9i9RvIW0hb5W2Qjv9RwP46ET06ztae/BUOVI3LpUhu8i8Oj2
        Npu8ms5dgIa3BERfmTH7S4xi/gaDSgfXZ7pQpllajpVE7/0vRCAeqKxTgt7PDR9TAIxildH8aTHkr
        dMzB9AlQWQN+vZG72Rcpl3f4X91Y16BQxeFEHTaNk3sbCa7e6tbGq+aeaTO2mEJH9R90KVRPL2As0
        xuyYUvkQ==;
Received: from p200300ccff136d001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff13:6d00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1pHjp4-0004v6-VW; Tue, 17 Jan 2023 12:08:11 +0100
Date:   Tue, 17 Jan 2023 12:08:10 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     linux-omap@vger.kernel.org, peter.ujfalusi@gmail.com,
        jarkko.nikula@bitmer.com
Subject: omap  mcbsp and prcm_fck
Message-ID: <20230117120810.6cf8b6f7@aktux>
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

while trying to create a devicetree for a omap4 device, I stumbled upon this:

[   59.789367] omap-mcbsp 40124000.mcbsp: CLKS: could not clk_get() prcm_fck

But where should prcm_fck come from? The string does not appear in the
devicetree binding documentation. I have seen it only in the omap_hwmod_* stuff
used by omap2/3.

So how to make mcbsp happy?

Regards,
Andreas
