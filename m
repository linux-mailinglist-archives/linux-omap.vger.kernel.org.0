Return-Path: <linux-omap+bounces-4828-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9F5C2DED5
	for <lists+linux-omap@lfdr.de>; Mon, 03 Nov 2025 20:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 150F31889E49
	for <lists+linux-omap@lfdr.de>; Mon,  3 Nov 2025 19:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AE4299A85;
	Mon,  3 Nov 2025 19:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kkt4JyOR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963D61F2BA4
	for <linux-omap@vger.kernel.org>; Mon,  3 Nov 2025 19:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762199159; cv=none; b=ThrqqTee3e3hsQD6y70/zq2nv/xkQZYLreSlrCHOR6Vyt+zFGxbFE3ITEARHOTaEnW2CXOdREutPgc+ELpLpdG6dmQSMuOSbmt+E05xfLUaav3NZydVsTcPgEflsPhvQZG16UvpPO0goEEU05ychkUo2a2ELj+A/4/Cf7/Iwy50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762199159; c=relaxed/simple;
	bh=IPTBE8hzRKTSZ+5Dq4mYL083Sn9ZhFw3PxQbIPLRuNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tky2oHyri1pbE+OrmnqsVNYDYjbz2DXkDCoJaNHc2GgOd3jBhHq9cEhveXDTJ/1/GSWWPI7R/PIuKgziB65+EjFdtlEnepXxy8Z2elpWaJnekTuMlJwqZBAi70K0FwUh3d4YwRyALKzBQKP/kpJUX8ShW7KbwR3DFgZEcO0MZmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kkt4JyOR; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-63e16fbdd50so4123767d50.2
        for <linux-omap@vger.kernel.org>; Mon, 03 Nov 2025 11:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762199156; x=1762803956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zDgrJGPwTkDqRWUIRmg2o0UWPQlQh5Pa4lWjqQeT3Vs=;
        b=Kkt4JyOR0bnSMdAAot+yuwREiDggObyb9FkBryzKkFA3AxVH8Tm/u0Fk/mF4zsTZoH
         mcxNtLiSk2jWYd7USg7j/iauoVq+6C2GBd/RSNTvgdQK9dwQY9dZL/yNnNjI+4V4x43l
         HNfO2seHzvyEMzP3QF7dxS832mPweLjFhxKbGbM0qz7h7+Lsbsh+CyLgtltX+oXFv7j8
         zCRSs10iH7zPnU6u/AtxZR4u7pPJX6gCjyDeHTe+R6qV0hNIXqArL+zR8F0v0KGXYkMB
         e2cJNzzxKZsA9dk9/EFm5tq9LPnX/JZDRl+q13wUwexKPIyg80sYF4/LkAUikIuIzsR6
         25VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762199156; x=1762803956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDgrJGPwTkDqRWUIRmg2o0UWPQlQh5Pa4lWjqQeT3Vs=;
        b=qMXsmtqDkhGXIEZw7EC8Uo08o9D04CmyDLEQJmAB6qzUnjSeQj5fsihe6I5pj07tKS
         Z6l+I3mTKwxw9N8DEuqoWHB9Ow9kVOdLId4R8iDAub+fPb+WGt1E/sij4GUTAFqZg4dC
         ZsnCCdPz9WT1nByp3wq+VC7skyAqBsJQH4FpZYg7C9x31Kxm+RKm6rQjVuIPwA7nU7Xp
         Oan0Hj+TTORIjTDdrvjp+VuvGWYttG1SM5Sn/4qkcMn3ChtgzCIdVl/aABpvbbjDotVw
         W4j1aM9MhmSSbmPs2Tj4qxgwPJbaiwpMoH0RcPy7Cdg1hVScY/7CTMJM3x0yfFUysLwD
         +KkA==
X-Forwarded-Encrypted: i=1; AJvYcCWsrx4rp958wv5G1TSOSHgkN7AkmjecxnqNwMNez0ThYOLlxgIdaEMjAEsB1KUO8IKKR9Uxk02I9J+m@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe+xzXw75SmSlZo9EMkiiQh1sZYsm1XZBeER1pxBNDKu9SkRK+
	xtehxjSAaegWtgwHQiQut4j3q/oTJQZ+Q6azm71w043q3+Edcf6GQcel
X-Gm-Gg: ASbGncuF9tfrjas/KbiIf67K9wYB/fxO3gtcZ8hxMPRAAPE7mY9WW/6azm+O2qmtqcE
	n7t12dnFroq+nthPeZso6bD3RV7K+eNvcXe1P+Dbv0bsppQ5UWfvxoWIP7wOwnPnR1CIEOLKZTJ
	N3qVOMLHCQdvDyqhTW4HCyojpYSn2v/RJBCn/SAg8HUxVLorYga82gsGdcHAmYBnhWSB9iqZ71p
	IutuZPdwtEyb5FkwGv7U0JEugs12wAA2ZaZx7Zx/uiP/xSL6jvwroH8XkmKA+XyqbCy5qGovtR2
	IcZnGg+3LT7wF9WgRL+UZ9uF3ocpo7h0HXCPr4ZiI1bdOoFiJGO1idulGttGAH1NPyGhHISYPkg
	0pu4QfXS5iwYHknHk+V21nvUxHHHMPD04aX+P0f5puRm/mjAFeLYwtSY738sxzfpbrO0L3EVlKO
	vUnWJ/Ci1CTsejC3m4XHqEs8TRB4QPeW8=
X-Google-Smtp-Source: AGHT+IGNH0RPJesBeIcKsla8XUDm1bFpyEtjHsBQ6vejr6g2P49YD8AtgFLGMiN2odUrOWMz5ZeYtA==
X-Received: by 2002:a05:690c:6706:b0:786:8dc1:5242 with SMTP id 00721157ae682-7868dc1591dmr18450727b3.53.1762199156319;
        Mon, 03 Nov 2025 11:45:56 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:72::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7869200367fsm3408667b3.42.2025.11.03.11.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:45:55 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Srujana Challa <schalla@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Brett Creeley <brett.creeley@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Jerin Jacob <jerinj@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Mark Bloch <mbloch@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Petr Machata <petrm@nvidia.com>,
	Manish Chopra <manishc@marvell.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Dave Ertman <david.m.ertman@intel.com>,
	Vlad Dumitrescu <vdumitrescu@nvidia.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org
Subject: [PATCH net-next v2 0/2] devlink: net/mlx5: implement swp_l4_csum_mode via devlink params
Date: Mon,  3 Nov 2025 11:45:51 -0800
Message-ID: <20251103194554.3203178-1-daniel.zahka@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains two patches. The first is a pure refactor that
passes through the extack to devlink_param::get() implementations. The
second introduces a permanent devlink param to the mlx5 driver for
controlling tx csum behavior.

Enabling extack for devlink_param::get() allows drivers to provide
more information in cases when reading parameters from hardware can
result in errors or unexpected values.

The mlx5 swp_l4_csum_mode devlink param is necessary for initializing
PSP on CX7 NICs.

CHANGES:
v2:
  - fix indentation issue in new mlx5.rst entry
  - use extack in mlx5_nv_param_devlink_swp_l4_csum_mode_get()
  - introduce extack patch.
v1: https://lore.kernel.org/netdev/20251022190932.1073898-1-daniel.zahka@gmail.com/

Daniel Zahka (2):
  devlink: pass extack through to devlink_param::get()
  net/mlx5: implement swp_l4_csum_mode via devlink params

 Documentation/networking/devlink/mlx5.rst     |   9 +
 .../marvell/octeontx2/otx2_cpt_devlink.c      |   6 +-
 drivers/net/ethernet/amd/pds_core/core.h      |   3 +-
 drivers/net/ethernet/amd/pds_core/devlink.c   |   3 +-
 .../net/ethernet/broadcom/bnxt/bnxt_devlink.c |   6 +-
 .../net/ethernet/intel/ice/devlink/devlink.c  |  12 +-
 .../marvell/octeontx2/af/rvu_devlink.c        |  15 +-
 .../marvell/octeontx2/nic/otx2_devlink.c      |   6 +-
 drivers/net/ethernet/mellanox/mlx4/main.c     |   6 +-
 .../net/ethernet/mellanox/mlx5/core/devlink.h |   3 +-
 .../net/ethernet/mellanox/mlx5/core/eswitch.c |   3 +-
 .../mellanox/mlx5/core/eswitch_offloads.c     |   3 +-
 .../net/ethernet/mellanox/mlx5/core/fs_core.c |   3 +-
 .../ethernet/mellanox/mlx5/core/fw_reset.c    |   3 +-
 .../mellanox/mlx5/core/lib/nv_param.c         | 170 +++++++++++++++++-
 .../mellanox/mlxsw/spectrum_acl_tcam.c        |   3 +-
 .../ethernet/netronome/nfp/devlink_param.c    |   3 +-
 drivers/net/ethernet/qlogic/qed/qed_devlink.c |   3 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   3 +-
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      |   3 +-
 drivers/net/ethernet/ti/cpsw_new.c            |   6 +-
 drivers/net/wwan/iosm/iosm_ipc_devlink.c      |   3 +-
 include/net/devlink.h                         |   3 +-
 include/net/dsa.h                             |   3 +-
 net/devlink/param.c                           |  19 +-
 net/dsa/devlink.c                             |   3 +-
 26 files changed, 257 insertions(+), 46 deletions(-)

-- 
2.47.3


