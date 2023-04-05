Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACBC46D8377
	for <lists+linux-omap@lfdr.de>; Wed,  5 Apr 2023 18:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbjDEQTe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Apr 2023 12:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbjDEQTa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Apr 2023 12:19:30 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B28219A4;
        Wed,  5 Apr 2023 09:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YbHus8I5k6Kw59s8tS5l+mzZMN+5KPjsnPShZjTEdZ0=; b=9MztCnSgRNYvoKtFw8RHTv+bD0
        p9yWnRsse5Aga0jrzNQhuO6wPo8hMw7PLDS/RK1J+xWM3Dxz/9FeErS4+njaYHRyCXq0fHq8aSfLL
        amo7gegXvx1be/eakGRjK6PrzoEA7UfhbvVdL4SdcmiUR7RzR82Lszqq7CqBUwa5UGhb+gu5zx3AU
        BxKIfk3YuCbsy2bSBmf3H5t6vqnUyO1MXsB0CiasIKfLnDJTarYPwQ98h55CieAYmspTwib81adhn
        JGS5LeIyAHx3Rg6CLGkaNtbLI/Ks7WMCiJzy/3PaAgTCDmD6qcjF9yz2r6pCcOqTYEJEtelygX6wG
        SeA0FzGg==;
Received: from p200300ccff0b98001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:9800:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1pk5qp-0001uB-52; Wed, 05 Apr 2023 18:19:12 +0200
Received: from andi by aktux with local (Exim 4.96)
        (envelope-from <andreas@kemnade.info>)
        id 1pk5qo-00017y-1V;
        Wed, 05 Apr 2023 18:19:10 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        tony@atomide.com, andreas@kemnade.info, afd@ti.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v6 2/2] MAINTAINERS: add board bindings list to OMAP2+ files
Date:   Wed,  5 Apr 2023 18:19:08 +0200
Message-Id: <20230405161908.4312-3-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405161908.4312-1-andreas@kemnade.info>
References: <20230405161908.4312-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add list of OMAP2+ boards to the corresponding section

CC: linux-omap@vger.kernel.org
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 40e26624ff24b..5414ca882e031 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15363,6 +15363,7 @@ W:	http://www.muru.com/linux/omap/
 W:	http://linux.omap.com/
 Q:	http://patchwork.kernel.org/project/linux-omap/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git
+F:	Documentation/devicetree/bindings/arm/ti/omap.yaml
 F:	arch/arm/configs/omap2plus_defconfig
 F:	arch/arm/mach-omap2/
 F:	drivers/bus/ti-sysc.c
-- 
2.39.2

