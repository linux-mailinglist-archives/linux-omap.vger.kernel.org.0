Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71D8141F6C8
	for <lists+linux-omap@lfdr.de>; Fri,  1 Oct 2021 23:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355197AbhJAVTu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Oct 2021 17:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbhJAVTt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Oct 2021 17:19:49 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58193C061775;
        Fri,  1 Oct 2021 14:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=PdSBB4OD8Z96jv9k0gbPRt7UamTTE3IqtKafpBbsEtc=; b=B4tqVKothBlBDJde4YFtdv2lmr
        EC3Wk1ZTii7bE7imNJ2jcJ2mqRnWhenhjUUCOPSiHg1iZ9iz/NN7brum2O1F3magOOZnZPwaeQjzu
        x/wtHGt6dMvUGV/kZC8DJGr78oM5tO/Yt8ZkDMod6FVzb76WqiSHEQLudZUYWC9NiVdg=;
Received: from p200300ccff0b42001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:4200:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mWPun-0002Ck-3o; Fri, 01 Oct 2021 23:17:57 +0200
Received: from andi by aktux with local (Exim 4.94.2)
        (envelope-from <andreas@kemnade.info>)
        id 1mWPum-00CGR3-GI; Fri, 01 Oct 2021 23:17:56 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org, vigneshr@ti.com,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-omap@vger.kernel.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH] dt-bindings: serial: 8250_omap: allow serdev subnodes
Date:   Fri,  1 Oct 2021 23:17:31 +0200
Message-Id: <20211001211731.2923066-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

additionalProperties: false
ignores the pattern matching for serdev objects in serial.yaml, causing
error messages when serdev subnodes like bluetooth or gnss devices are
defined. Using unevaluatedProperties instead is the correct way
if arbitrary children nodes can appear.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 Documentation/devicetree/bindings/serial/8250_omap.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/8250_omap.yaml b/Documentation/devicetree/bindings/serial/8250_omap.yaml
index 70ca61688bb9..7b34ec8fa90e 100644
--- a/Documentation/devicetree/bindings/serial/8250_omap.yaml
+++ b/Documentation/devicetree/bindings/serial/8250_omap.yaml
@@ -86,7 +86,7 @@ required:
   - reg
   - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 if:
   properties:
-- 
2.30.2

