Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFA96B51C9
	for <lists+linux-omap@lfdr.de>; Tue, 17 Sep 2019 17:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729785AbfIQPta (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Sep 2019 11:49:30 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42819 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727147AbfIQPta (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Sep 2019 11:49:30 -0400
Received: by mail-io1-f67.google.com with SMTP id n197so8714582iod.9
        for <linux-omap@vger.kernel.org>; Tue, 17 Sep 2019 08:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UxRu0hfIOj7rnd/2d0FeY2ghe0hTXPZWI+QnR+jIQvc=;
        b=nkDZySz1oxziYyP/913cQGVX9HYiBvKraEPhcAARX4DyYrCHL7/dA+CU+dYGnlpvN6
         VKkTvIV00sRa2E/exN9GxEnO9VdJZJtLwkfeepRggxag8Sj/00YqJ1llhaxzYPlOVDEe
         boZcAd0hXnNoa5aXzh2J7OpKxupRn1iqQz3/0AJ+m48l6kdVzUJmTuXiZANpbvrG8KBG
         HbgV9R4le+C4Vbyo70ibE8AxW87Whn4ngBK+V9SW0bCNRSbqZ/Oq5LHOvLVwspJB34nV
         IbMUj7dg0F0RvtGGT/3g3l2x8EMNNkrC4rJvjDDYQe5RH6K9Jtlptapytp9sOgQhxP1F
         xMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UxRu0hfIOj7rnd/2d0FeY2ghe0hTXPZWI+QnR+jIQvc=;
        b=YK9MgtaXfje3gYXGobmS+8ozLEw3c9EJVGsbGnn+zSqlaqp5oxXf10yZmnouMUuplm
         kp0MQ9w1BJ5OuEDeQCKqVnP3O9KRGO7beyNc4xUsnLG4ewV+XumTu69i1AGzzvhinuYa
         V5m0Ib0kiciwfM+UFWyD6PVTFmUtTmcgVuf1XVfOjUWi9Unw8SAPs95nl9unypT3XiDr
         ZuYBuTikyVt3F04CcPkBJaYSyEjpszyjtq3LB/2SKSVtJTGEpjHCmHN7yvw/9JC6J2CY
         PtBnCg9DuZ/dX7lgNKNKdXr1NAT9q+C7X5HLyK7jz30XviECPn/91i12l5p9deC5n1iI
         /nag==
X-Gm-Message-State: APjAAAWdJLc0TKtqKorO5kW6zjGj2Bd/kV9D2joHwmASYKCJd2JI3Dv4
        5VkAvaKFQWf+yP5oepkIZPd+LMYFSlA=
X-Google-Smtp-Source: APXvYqzMAbytdq+L+rdLuxfU+Sv3D600a69hFO3BIMhz1J3VNLoE0wmv3inaXoYyLdgA+52AaeOf2A==
X-Received: by 2002:a02:92:: with SMTP id 140mr4328878jaa.98.1568735369278;
        Tue, 17 Sep 2019 08:49:29 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id x26sm1737367ioa.37.2019.09.17.08.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 08:49:28 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>
Subject: [PATCH] ARM: dts: logicpd-torpedo-baseboard: Reduce video regulator chatter
Date:   Tue, 17 Sep 2019 10:49:23 -0500
Message-Id: <20190917154923.1073-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The dss driver wants two regulators or it dump some splat while
initializing.  This patch adds a reference to the second regulator
which to avoid the warnings that the regulator is missing.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
index 449cc7616da6..184e462d96ab 100644
--- a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
+++ b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
@@ -108,6 +108,7 @@
 &dss {
 	status = "ok";
 	vdds_dsi-supply = <&vpll2>;
+	vdda_video-supply = <&vpll2>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&dss_dpi_pins1>;
 	port {
-- 
2.17.1

